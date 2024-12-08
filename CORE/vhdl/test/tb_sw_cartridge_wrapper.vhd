----------------------------------------------------------------------------------
-- Commodore 64 for MEGA65
--
-- This is a testbench for the sw_cartridge_wrapper module.
--
-- done by MJoergen in 2023 and licensed under GPL v3
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_sw_cartridge_wrapper is
   generic (
      G_FILE_NAME : string := ""
   );
end entity tb_sw_cartridge_wrapper;

architecture simulation of tb_sw_cartridge_wrapper is

   -- Clock and reset
   signal qnice_clk            : std_logic := '0';
   signal qnice_rst            : std_logic := '1';
   signal qnice_running        : std_logic := '1';
   signal main_clk             : std_logic := '0';
   signal main_rst             : std_logic := '1';
   signal main_running         : std_logic := '1';
   signal mem_clk              : std_logic := '0';
   signal mem_rst              : std_logic := '1';
   signal mem_running          : std_logic := '1';

   signal main_reset_core      : std_logic;
   signal main_loading         : std_logic;
   signal main_id              : std_logic_vector(15 downto 0);
   signal main_exrom           : std_logic_vector( 7 downto 0);
   signal main_game            : std_logic_vector( 7 downto 0);
   signal main_size            : std_logic_vector(22 downto 0);
   signal main_bank_laddr      : std_logic_vector(15 downto 0);
   signal main_bank_size       : std_logic_vector(15 downto 0);
   signal main_bank_num        : std_logic_vector(15 downto 0);
   signal main_bank_raddr      : std_logic_vector(24 downto 0);
   signal main_bank_wr         : std_logic;
   signal main_bank_wait       : std_logic;
   signal main_ram_data        : std_logic_vector( 7 downto 0);
   signal main_io_we           : std_logic;
   signal main_lo_ram_data     : std_logic_vector(15 downto 0);
   signal main_hi_ram_data     : std_logic_vector(15 downto 0);
   signal main_io_ram_data     : std_logic_vector( 7 downto 0);
   signal main_ram_addr        : std_logic_vector(15 downto 0);
   signal main_bank_lo         : std_logic_vector( 6 downto 0);
   signal main_bank_hi         : std_logic_vector( 6 downto 0);
   signal main_ram_wr_addr     : std_logic_vector(15 downto 0);
   signal main_ram_wr_data     : std_logic_vector( 7 downto 0);
   signal main_ram_wr_en       : std_logic;
   signal main_freeze          : std_logic;

   -- Add extra wait states during bank switching
   signal main_extra_wait      : std_logic;
   signal main_game_d          : std_logic_vector(7 downto 0);
   signal main_exrom_d         : std_logic_vector(7 downto 0);
   signal main_bank_lo_d       : std_logic_vector(6 downto 0);
   signal main_bank_hi_d       : std_logic_vector(6 downto 0);
   signal main_sim_wait        : std_logic;
   signal main_wait_timer      : natural;

   signal qnice_addr           : std_logic_vector(27 downto 0);
   signal qnice_writedata      : std_logic_vector(15 downto 0);
   signal qnice_ce             : std_logic;
   signal qnice_we             : std_logic;
   signal qnice_readdata       : std_logic_vector(15 downto 0);
   signal qnice_wait           : std_logic;

   signal mem_write            : std_logic;
   signal mem_read             : std_logic;
   signal mem_address          : std_logic_vector(31 downto 0);
   signal mem_writedata        : std_logic_vector(15 downto 0);
   signal mem_byteenable       : std_logic_vector( 1 downto 0);
   signal mem_burstcount       : std_logic_vector( 7 downto 0);
   signal mem_readdata         : std_logic_vector(15 downto 0);
   signal mem_readdatavalid    : std_logic;
   signal mem_waitrequest      : std_logic;
   signal mem_length           : natural;

begin

   -------------------
   -- Clock and reset
   -------------------

   mem_clk   <= mem_running   and not mem_clk   after  5 ns;
   qnice_clk <= qnice_running and not qnice_clk after 10 ns;
   main_clk  <= main_running  and not main_clk  after 15 ns;

   mem_rst   <= '1', '0' after 100 ns;
   qnice_rst <= '1', '0' after 100 ns;
   main_rst  <= '1', '0' after 100 ns;


   -------------------
   -- Instantiate DUT
   -------------------

   i_sw_cartridge_wrapper : entity work.sw_cartridge_wrapper
      generic map (
         G_BASE_ADDRESS => (others => '0')
      )
      port map (
         qnice_clk_i         => qnice_clk,
         qnice_rst_i         => qnice_rst,
         qnice_addr_i        => qnice_addr,
         qnice_data_i        => qnice_writedata,
         qnice_ce_i          => qnice_ce,
         qnice_we_i          => qnice_we,
         qnice_data_o        => qnice_readdata,
         qnice_wait_o        => qnice_wait,
         main_clk_i          => main_clk,
         main_rst_i          => main_rst,
         main_reset_core_o   => main_reset_core,
         main_loading_o      => main_loading,
         main_id_o           => main_id,
         main_exrom_o        => main_exrom,
         main_game_o         => main_game,
         main_size_o         => main_size,
         main_bank_laddr_o   => main_bank_laddr,
         main_bank_size_o    => main_bank_size,
         main_bank_num_o     => main_bank_num,
         main_bank_raddr_o   => main_bank_raddr,
         main_bank_wr_o      => main_bank_wr,
         main_bank_lo_i      => main_bank_lo,
         main_bank_hi_i      => main_bank_hi,
         main_bank_wait_o    => main_bank_wait,
         main_ram_addr_i     => main_ram_addr,
         main_ram_data_i     => main_ram_data,
         main_io_we_i        => main_io_we,
         main_lo_ram_data_o  => main_lo_ram_data,
         main_hi_ram_data_o  => main_hi_ram_data,
         main_io_ram_data_o  => main_io_ram_data,
         mem_clk_i           => mem_clk,
         mem_rst_i           => mem_rst,
         mem_write_o         => mem_write,
         mem_read_o          => mem_read,
         mem_address_o       => mem_address,
         mem_writedata_o     => mem_writedata,
         mem_byteenable_o    => mem_byteenable,
         mem_burstcount_o    => mem_burstcount,
         mem_readdata_i      => mem_readdata,
         mem_readdatavalid_i => mem_readdatavalid,
         mem_waitrequest_i   => mem_waitrequest
      ); -- i_sw_cartridge_wrapper

   -----------------------------------
   -- Instantiate simulation models
   -----------------------------------

   i_qnice_sim : entity work.qnice_sim
      port map (
         qnice_clk_i       => qnice_clk,
         qnice_rst_i       => qnice_rst,
         qnice_addr_o      => qnice_addr,
         qnice_writedata_o => qnice_writedata,
         qnice_ce_o        => qnice_ce,
         qnice_we_o        => qnice_we,
         qnice_readdata_i  => qnice_readdata,
         qnice_wait_i      => qnice_wait,
         qnice_length_i    => std_logic_vector(to_unsigned(mem_length*2, 32)),
         qnice_running_o   => qnice_running
      ); -- i_qnice_sim

   i_core_sim : entity work.core_sim
      port map (
         main_clk_i          => main_clk,
         main_rst_i          => main_rst,
         main_reset_core_i   => main_reset_core,
         main_loading_i      => main_loading,
         main_id_i           => main_id,
         main_exrom_i        => main_exrom,
         main_game_i         => main_game,
         main_size_i         => main_size,
         main_bank_laddr_i   => main_bank_laddr,
         main_bank_size_i    => main_bank_size,
         main_bank_num_i     => main_bank_num,
         main_bank_raddr_i   => main_bank_raddr,
         main_bank_wr_i      => main_bank_wr,
         main_bank_lo_o      => main_bank_lo,
         main_bank_hi_o      => main_bank_hi,
         main_bank_wait_i    => main_bank_wait or main_sim_wait,
         main_ram_addr_o     => main_ram_addr,
         main_ram_data_o     => main_ram_data,
         main_io_we_o        => main_io_we,
         main_lo_ram_data_i  => main_lo_ram_data,
         main_hi_ram_data_i  => main_hi_ram_data,
         main_io_ram_data_i  => main_io_ram_data,
         main_running_o      => main_running,
         main_ram_wr_addr_i  => main_ram_wr_addr,
         main_ram_wr_data_i  => main_ram_wr_data,
         main_ram_wr_en_i    => main_ram_wr_en,
         main_freeze_i       => main_freeze
      ); -- i_core_sim


   -- Add extra wait states during bank switching
   main_extra_wait <= '1' when main_game    /= main_game_d or
                               main_exrom   /= main_exrom_d or
                               main_bank_lo /= main_bank_lo_d or
                               main_bank_hi /= main_bank_hi_d
                 else '0';

   main_sim_wait <= '1' when main_wait_timer > 0
               else main_extra_wait;

   p_wait : process (main_clk)
   begin
      if rising_edge(main_clk) then
         if main_wait_timer > 0 then
            main_wait_timer <= main_wait_timer - 1;
         end if;

         if main_extra_wait = '1' then
            main_wait_timer <= 20;
         end if;

         main_game_d    <= main_game;
         main_exrom_d   <= main_exrom;
         main_bank_lo_d <= main_bank_lo;
         main_bank_hi_d <= main_bank_hi;
      end if;
   end process p_wait;

   i_avm_rom : entity work.avm_rom
      generic map (
         G_INIT_FILE    => G_FILE_NAME,
         G_ADDRESS_SIZE => 16,
         G_DATA_SIZE    => 16
      )
      port map (
         clk_i               => mem_clk,
         rst_i               => mem_rst,
         avm_write_i         => mem_write,
         avm_read_i          => mem_read,
         avm_address_i       => mem_address(15 downto 0),
         avm_writedata_i     => mem_writedata,
         avm_byteenable_i    => mem_byteenable,
         avm_burstcount_i    => mem_burstcount,
         avm_readdata_o      => mem_readdata,
         avm_readdatavalid_o => mem_readdatavalid,
         avm_waitrequest_o   => mem_waitrequest,
         length_o            => mem_length
      ); -- i_avm_rom

   p_keyboard : process

      procedure force_keypress(wait_time : time; key : std_logic_vector) is
      begin
         main_ram_wr_addr <= X"0000";
         main_ram_wr_data <= X"00";
         main_ram_wr_en   <= '0';
         wait for wait_time;
         wait until rising_edge(main_clk);

         -- Fill in start of keyboard buffer
         main_ram_wr_addr <= X"0277";
         main_ram_wr_data <= key;
         main_ram_wr_en   <= '1';
         wait until rising_edge(main_clk);
         wait until rising_edge(main_clk);

         -- Set length of keyboard buffer
         main_ram_wr_addr <= X"00C6";
         main_ram_wr_data <= X"01";
         main_ram_wr_en   <= '1';
         wait until rising_edge(main_clk);
         wait until rising_edge(main_clk);

         -- Indicate key is released
         main_ram_wr_addr <= X"00C5";
         main_ram_wr_data <= X"40";
         main_ram_wr_en   <= '1';
         wait until rising_edge(main_clk);
         wait until rising_edge(main_clk);

         main_ram_wr_addr <= X"0000";
         main_ram_wr_data <= X"00";
         main_ram_wr_en   <= '0';
      end procedure force_keypress;

   begin
      -- Initial values
      main_ram_wr_addr <= X"0000";
      main_ram_wr_data <= X"00";
      main_ram_wr_en   <= '0';

      -- F7 key
      force_keypress(20 ms, X"88");
      wait;
   end process p_keyboard;

end architecture simulation;

