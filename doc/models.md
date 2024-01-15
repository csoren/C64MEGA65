C64 for MEGA65 on different MEGA65 models
=========================================

Choose the right core variant for your hardware
-----------------------------------------------

### TL;DR

If your MEGA65 was manufactured before 2024, then choose
`C64MEGA65-V5.1-R3.cor` otherwise choose `C64MEGA65-V5.1-R6.cor`.

### Details

We are supporting these MEGA65 models: R3/R3A, R4, R5 and R6. Use
the following table to ensure that you select and flash the correct `.cor`
from the [ZIP file](https://files.mega65.org?id=896a012f-59e4-456c-b91f-7e989b958241).

| MEGA65 model   |   Years   | File name             | Comment
|:--------------:|:---------:|:---------------------:|-------------------------
| R3/R3A         | @TODO     | C64MEGA65-V5.1-R3.cor | R3 is the "DevKit" (100 were built) and R3A are batches 1 and 2. If your MEGA65 was manufactured before 2024 then you have an R3 or R3A machine.
| R4             | 2023      | C64MEGA65-V5.1-R4.cor | Development board on our way to the R6. Only 10 of them were manufactured (board only, no complete machines).
| R5             | 2023      | C64MEGA65-V5.1-R5.cor | Upgraded version of R4 that contains new circuits for the expansion port. Only 10 of them were manufactured (board only, no complete machines).
| R6             | 2024+     | C64MEGA65-V5.1-R6.cor | Latest and greatest MEGA65. Manufactured from 2024 on.

Only use `*.bit` files if you know what you are doing.

Differences in the C64 for MEGA65 core on different MEGA65 models
-----------------------------------------------------------------

| Number | Topic                                            | Details                                                                                                                                                                                                                                                                | R3/R3A   |   R4   | R5   | R6   |
|:------:|:------------------------------------------------:|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------:|:------:|:----:|:----:|
| 1      | HDMI backpower issues                            | [Learn more](../FAQ.md#2-my-mega65-or-the-c64-core-is-behaving-somehow-weirdly), what wide range of problems and strange effects HDMI backpower issues are creating and how to avoid these issues.                                                                     | yes      | no     | no   | no   |
| 2      | DAC for analog 3.5mm audio jack                  | While on R3/R3A machines the analog audio that comes out from the 3.5mm audio jack is "OK" and sometimes is plagued by hissing and humming, the newer machines feature a high-quality audio digital to analog converter (DAC) that leads to a crystal clear output.    | standard | DAC    | DAC  | DAC  |
| 3      | Hardware cartridges: Bi-directional reset signal | Makes the core compatible with even more cartridges. Two examples that stand out are: (1) You do not need the "reset workaround" for the Kung Fu Flash (KFF) any more (2) Reset buttons and "special" buttons at most freezer cartridges are working now.              | no       | no     | yes  | yes  |
| 4      | Supercapacitor for Real-Time-Clock (RTC)         | Ensures that the MEGA65 remembers the date/time even if you did not install a CR2032 battery.                                                                                                                                                                          | no       | yes    | yes  | yes  |
