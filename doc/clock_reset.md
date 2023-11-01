# Clock and Reset in MiSTer2MEGA65

The M2M framework uses a number of different clock domains, and associated reset signals:

Source | Clock Name  | Reset Name  | Use
------ | ----------  | ----------  | -----
M2M    | `qnice_clk` | `qnice_rst` | OSM (QNICE)
M2M    | `audio_clk` | `audio_rst` | Audio
M2M    | `hr_clk_x1` | `hr_rst`    | HyperRAM
M2M    | `hdmi_clk`  | `hdmi_rst`  | HDMI
CORE   | `core_clk`  | `core_rst`  | Core (The main clock for the core)
CORE   | `video_clk` | `video_rst` | Video (Optional, otherwise same as Core)

Each clock domains associated reset signal is automatically asserted upon power-on, and
de-asserted when the corresponding clock signal (from the MMCM) is stable.

## Reset handling

The MEGA65 has an external reset button on the left of the case. This is used to control
the assertion of the reset signals after power-on.

Two modes of operation are supported by the framework:
* Core Reset (short press): only `core_rst` is asserted.
* Full Reset (long press): complete system, i.e. all resets are asserted.

## Specific complication with the HyperRAM
The interface between the FPGA and the HyperRAM device is stateful, meaning that if either
end is reset, the other end must be reset too. Furthermore, the interface from the HDMI
ascal'er to the HyperRAM is stateful too. Finally, the Core is using the HyperRAM
interface too.  This all implies the need for a very strict reset handling, where either
none or all are reset simultaneously. This applies specifically to the three reset signals
`hr_rst`, `hdmi_rst`, and `core_rst`.

