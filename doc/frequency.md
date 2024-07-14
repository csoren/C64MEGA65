# CPU clocking

For the original C64 in PAL mode we have the following:

> All clock frequencies in the C64 are derived from a single clock quartz which has the
> frequency of 4 times the frequency of the color carrier used for PAL or NTSC.
> [1](https://codebase64.org/doku.php?id=base:cpu_clocking)
> ...
> The CPU frequency is then calculated from that by simply dividing the frequency by 18 (PAL).

For PAL mode, the color carrier frequency is 4.43361875 MHz
[2](https://en.wikipedia.org/wiki/PAL#Colour_encoding), so the CPU frequency is
4433618.75\*4\/18 = 985248.61 Hz.

In other words, this is the nominal clock frequency for an original C64 in PAL mode.

## HDMI flicker free
WIth the nominal clock frequency, we can calculate the corresponding frame rate as
985248.61 \/ 312 \/ 63 = 50.12457 Hz.

This frame rate works perfectly for a VGA monitor, which will adjust it's frame rate
accordingly. HDMI monitors, however, insist on a frame rate of exactly 50.000 Hz.
The discrepancy of 1\/4 % leads to screen tearing approx every 8 seconds.

On the MEGA65 this is solved by reducing the C64 clock frequency to exactly 50\*63\*312 =
982800 Hz.

The above calculations leads to the following two nominal frequenciy values:
* Flicker free off : 985248.61 Hz
* Flicker free on : 982800.00 Hz

## Variance
On the MEGA65, the above frequencies are derived from a single crystal oscillator. This
leads to two consequencies:
* There is some device variation of the crystals used. Typical variance is 200 ppm. In
  practice this means a variation on the CPU clock frequency of +/- 200 Hz.

* The ratio between the two frequencies above (HDMI flicker free on/off) will always be
  the same, because they derive from the same source clock.

