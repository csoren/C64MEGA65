Real-Time-Clock (RTC) for GEOS
==============================

The MEGA65's Real Time Clock (RTC) is able to power the date/time in GEOS.


How to use the RTC in GEOS
--------------------------

1. Optional: Learn [how to use GEOS using C64 for MEGA65](https://github.com/MJoergen/C64MEGA65/blob/develop/FAQ.md#16-how-can-i-work-with-geos)
1. Use the MEGA65's "Configuration Utility" to set the correct date and time. Learn more in the
   [MEGA65 User's Guide](https://files.mega65.org?id=a5081244-a976-4a21-9153-27cca13fd613)
   chapter "The Configuration Utility".
2. Download the GEOS RTC driver [here](https://github.com/MJoergen/C64MEGA65/raw/master/doc/assets/CP-ClockF83_1.3.D64).
4. Use a tool like [DirMaster](https://style64.org/dirmaster) to extract the driver `CP-CLOCK-1.3.PRG` from the `.D64` file
   and to add it to your personal GEOS boot disk, which might for example be called `GEOS64.D64`.

### Difference between pre-2024 MEGA65s and 2024+ MEGA65s

* If you have a pre-2024 MEGA65 modelAs described in the "MEGA65 User's Guide"
* Learn more details about the different MEGA65 models [here](models.md).

Background and History: CP-Uhr F83 by Jörg Sproß
------------------------------------------------

  From a technical perspective, we are simulating the "CP-Uhr F83" by
  Jörg Sproß which uses a PCF8583 chip that is connected via the tape port.


![CP-Uhr](doc/assets/CP-ClockF83.jpg)

