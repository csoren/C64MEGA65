C64 for MEGA65 on different MEGA65 models
=========================================

Choose the right core variant for your hardware
-----------------------------------------------

We are supporting these MEGA65 variants: R3/R3A, R4 and R5. Use
the following table to ensure that you select and flash the correct `.cor`
from the [ZIP file](https://files.mega65.org?id=896a012f-59e4-456c-b91f-7e989b958241).

| MEGA65 Variant |   Years   | File name             | Comment
|:--------------:|:---------:|:---------------------:|-------------------------
| R3/R3A         | @TODO     | C64MEGA65-V5.1-R3.cor | R3 is the "DevKit" (100 were built) and R3A are batches 1 and 2. If you bought your MEGA65 between @TODO then you are very likely to have an R3 or R3A machine.
| R4             | @TODO     | C64MEGA65-V5.1-R4.cor | Development board on our way to the R5. Only @TODO of them were manufactured (board only, no complete machines)
| R5             | @TODO     | C64MEGA65-V5.1-R5.cor | @TODO

Only use `*.bit` files if you know what you are doing.


Differences in the C64 for MEGA65 core on different MEGA65 models
-----------------------------------------------------------------

| Number | Topic                           | Details                                                                                                                                                                                                                                                                | R3/R3A |   R4   | R5
|:------:|:-------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:------:|:------:|:----
| 1      | HDMI backpower issues           | [Learn more](FAQ.md#2-my-mega65-or-the-c64-core-is-behaving-somehow-weirdly), what wide range of problems and strange effects HDMI backpower issues are creating and how to avoid these issues.                                                                        | yes    | no     | no
| 2      | 3.5mm DAC for analog audio jack | While on R3/R3A machines the analog audio that comes out from the 3.5mm audio jack is "OK" and sometimes is plagued by hissing and humming, the R4/R5 machines feature a high-quality audio digital to analog converter (DAC) that leads to a crystal clear output.    | no DAC | DAC    | DAC


@TODO: INTERNAL LIST TO BE CLEARED BEFORE RELEASE
-------------------------------------------------

cartridges.md

1) EF3: Revisit all known issues and check, if we can fix them on R5
2) Kung Fu Flash: ditto
