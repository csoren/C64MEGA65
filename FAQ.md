# FAQ - Frequently Asked Questions

## 1) Which core should I install? I am confused what R3/R3A/R4/R5/R6 means

There are different MEGA65 models on the market.

Download Version 5.1
[here](https://files.mega65.org?id=896a012f-59e4-456c-b91f-7e989b958241). In
the ZIP file you will find multiple variants of the core: One for each
supported MEGA65 model:

* If your MEGA65 was manufactured before 2024, then install the "R3/R3A" core
which is`C64MEGA65-V5.1-R3.cor`.

* Otherwise install the "R6" core, which is
`C64MEGA65-V5.1-R6.cor`.

Learn more about the different MEGA65 models
[here](doc/models.md).

## 2) My MEGA65 or the C64 core is behaving somehow weirdly

If you own a MEGA65 that was built in 2024 or later, then you can skip this
section as the underlying hardware bug that haunts older boards is fixed.

**The "HDMI back powering problem" is the root of all evil!**

The evil things that can happen range from display problems over SD card
problems (such as problems mounting the SD card, reading from the SD card)
to issues around the system's overall stability.

If your MEGA65 is connected to any HDMI device: Never switch-on this device
before you have successfully switched-on your MEGA65. Or to put it the other
way round: **Always switch-on your MEGA65 first** and **THEN** switch-on your
HDMI device (monitor, frame grabber, etc.).

For the C64 core this means: While your MEGA65 and your HDMI device are
switched off: Hold the <kbd>No Scroll</kbd> key while you switch on the MEGA65
and while the HDMI device is still off. Now, you can switch on your HDMI
device and use the MEGA65's core selection menu to select the C64 core. You
can also use the key combination <kbd>No Scroll</kbd> + &lt;number of the
C64 core in the core menu&gt; to directly select the C64 core.

The reason for this problem is a bug on the MEGA65's mainboard revisions R3
and R3A.

Another way to resolve the issue is to put a cheap HDMI switch between the
MEGA65 and your device. You will find two Amazon links to devices that are
known to work
[here in Dan's MEGA65 Welcome Guide](https://dansanderson.com/mega65/welcome/hardware-issues.html?highlight=hdmi#failure-to-boot-and-keyboard-lights-glow-when-off).

## 3) The keyboard is not working

If your keyboard is working while you are using the MEGA65 core but you cannot
type properly while using the C64 core and the <kbd>Help</kbd> menu works fine
then please check if you have an **Amiga Mouse** or a joystick or other device
with activated auto-fire connected to port #1. If so, please remove it and you
will be able to type properly.

## 4) SD card errors

Most SD card problems can be resolved by considering these possible causes:

1. Are you having an [HDMI back powering problem](FAQ.md#2-my-mega65-or-the-c64-core-is-behaving-somehow-weirdly)?

2. Is your card formatted as something other than `FAT32`?

   Error `EE12` means "No or illegal partition table entry found (e.g. no FAT32 partition)".
   Some operating systems, for example MacOS format 8GB SD cards with FAT16 instead of FAT32.

   Stick to `FAT32`. Don't use any improved or more modern version of
   file-system. On Windows and Linux it is normally quite
   straightforward to format an SD card as `FAT32`. If you are on a
   Mac, scroll down and read "Formatting SD cards on a Mac".

3. Is your card larger than 32GB? The core cannot handle SD cards larger than 32 GB.

4. Are you using a cheap no-name card?

5. Please try to re-format your card and then copy everything on the card from scratch

6. If (1) to (5) do not help: Use another card: There is empiric evidence suggesting
   that SanDisk and Verbatim SD cards work better than others as long as they are
   not larger than 32GB and as long as they are `FAT32` formatted.

If you have a `Error code: 2704` in conjunction with an SD card error then
[this](https://discord.com/channels/719326990221574164/794775503818588200/1114834752281772043)
post on Discord might be interesting for you. But the bottom line is also in
this case: Step (5) or step (6) will solve the issue.

### Formatting SD cards on a Mac

* Mac OS' GUI tools try to be "smart". Do not use them, as you cannot
  control, if the tool creates FAT16 or FAT32. Use the command line
  version of `diskutil` instead:

  `sudo diskutil eraseDisk FAT32 <name> MBRFormat /dev/<devicename>`

  Find out `<devicename>` using `diskutil list`. `<name>` can be chosen
  arbitrarily.

* If you prefer a visual/GUI tool, then use the formatting tool that the
  official SD card organization provides:
  [Download it here](https://www.sdcard.org/downloads/formatter/sd-memory-card-formatter-for-mac-download/).

## 5) How compatible is the C64 core?

It is very compatible. Not yet as good as Vice but the
core runs hundreds of
[demanding demos flawlessly](tests/demos.md),
plays thousands of games without a single glitch, including games that need
a REU such as
[Sonic the Hedgehog](https://csdb.dk/release/?id=212523)
and the core offers disk writing abilities for the simulated 1541, so
that you can save your game states or your work in GEOS. The core also
let's you use original Commodore
[hardware cartridges](README.md#hardware-cartridges) plugged into the MEGA65
Expansion Port,
[simulate cartridges using CRT files](README.md#simulated-cartridges) and
[use retro Commodore peripherals](README.md#iec-devices)
by plugging them into the MEGA65's IEC port. You can even
[work with retro 15 kHz cathode ray tube monitors](doc/retrotubes.md).

## 6) I cannot format a disk image (`*.d64`)

Indeed, the core is not yet able to format disks. We do have this topic on our
[roadmap](ROADMAP.md). What we suggest is that you use tools like the awesome
[DirMaster](https://style64.org/dirmaster) to create a bunch of formatted, empty
`*.d64` disk images and then use these disk images with your C64 for MEGA65 core.

## 7) The screen goes black when I choose JiffyDOS

JiffyDOS is commercial software. The C64 core does not come with
a pre-installed copy of JiffyDOS.
[Learn here](doc/jiffy.md)
where to buy and how to install it.

## 8) My game or demo crashes

* Are you having an [HDMI back powering problem](FAQ.md#2-my-mega65-or-the-c64-core-is-behaving-somehow-weirdly)?

* Make sure you are using the newest version of the core. Right now this is
  [Version 5.1](https://files.mega65.org?id=896a012f-59e4-456c-b91f-7e989b958241).
  The only officially supported place to get cores is the
  [MEGA65 FileHost](https://files.mega65.org?id=896a012f-59e4-456c-b91f-7e989b958241),
  so make sure you downloaded your copy there. Do not use any Alpha or Beta versions
  any more. Also double-check by pressing <kbd>Help</kbd> and then choosing the menu
  item "About & Help" that you are really running Version 5.1.

* If the game or demo is not designed for the REU, you absolutely need to
  switch-off the REU before running the game or demo. Learn more about this
  important fact
  [here](README.md#512-kb-ram-expansion-unit-1750-reu).

* Double-check that you have the appropriate setting for "Expansion Port": If you
  are for exampling simulating a cartridge using a `.crt` file and then while doing so
  directly load a `.prg` file, then this might lead to a crash. But it might also work,
  if you are for example simulating a certain freezer cartridge.
  
* Power-cycle your MEGA65 (while making sure that you are not running into any
  [HDMI back powering problem](FAQ.md#2-my-mega65-or-the-c64-core-is-behaving-somehow-weirdly).
  The reset is not perfect and sometimes "stuff" remains in memory or in registers
  that prevents games or demos from starting.
  
* If you use [JiffyDOS](doc/jiffy.md) or any other fastloader (for example
  by using a freezer cartridge): Switch everything back to the C64's
  [standard Kernal](README.md#commodore-kernals-and-jiffydos) and try
  this very game or demo again.

* Try to run with deactivated "HDMI: Flicker-free", but don't forget to
  reactivate this afterwards, because your experience is 10x better with
  Flicker-free ON (at least when you're on HDMI). Learn more
  [here](README.md#flicker-free-hdmi).
  
* If you are using real 1541 hardware via the IEC port, please also read
  the [section about IEC devices below](FAQ.md#13-can-i-use-iec-devices).
  
* Many modern games and demos are mainly tested on the C64C, so try to run the
  game or demo using the setting "CIA: Use 8521 (C64C)".  

* If you are loading from a large storage device such as the SD2IEC, try
  the simulated 1541 drive using a `*.d64` disk image instead.

* Some games or demos don't like additional devices at the IEC port other than
  one drive #8. Try if switching off "IEC: Use hardware port" helps.

* [Create an issue](https://github.com/MJoergen/C64MEGA65/issues/new/choose)
  here on the official C64MEGA65 GitHub repository or post your problem in the
  [#c64-core](https://discord.com/channels/719326990221574164/794775503818588200)
  channel on Discord.

## 9) No image or no sound via HDMI

1. Make sure you are running [Version 5.1](https://files.mega65.org?id=896a012f-59e4-456c-b91f-7e989b958241)
   of the core.

2. Try everything that is described
   [here](https://github.com/MJoergen/C64MEGA65#hdmi-compatibility).

3. [Create an issue](https://github.com/MJoergen/C64MEGA65/issues/new/choose)
   here on the official C64MEGA65 GitHub repository or post your problem in the
   [#c64-core](https://discord.com/channels/719326990221574164/794775503818588200)
   channel on Discord.

## 10) The VGA output looks strange or flickers or I lose VGA sync

1. Always try the "auto-adjust" (or similarly named feature) of your screen
   first. This resolves 90% of all issues.

2. Switch-off "HDMI: Flicker-free" and learn more about the issue
   that the flicker-free mode sometimes creates on VGA systems
   [here](README.md#important-advice-for-users-of-analog-vga-and-retro-15-khz-rgb-over-vga).

3. If your monitor supports it, try to use the [retro "15 kHz RGB" mode](doc/retrotubes.md)

## 11) My retro monitor does not work with the core

### Analog devices

There is a [dedicated documentation](doc/retrotubes.md) that explains you how to
connect retro displays with cathode ray tubes to the MEGA65 using the Commodore 64
for MEGA65 core.

### LCD or TFT devices

Make sure that you have 
[switched-off HDMI: Flicker-free](README.md#important-advice-for-users-of-analog-vga-and-retro-15-khz-rgb-over-vga)
when using retro monitors via the MEGA65's VGA out.

## 12) My mouse does not work

Make sure that you use either a real C64 mouse or
[MouSTer](https://retrohax.net/shop/modulesandparts/mouster/).

The
[C64 mouse "1351"](https://www.c64-wiki.com/wiki/Mouse_1351)
is clearly superior to the C64 mouse "1350" as the latter one does not feature
proportional movements and therefore does not feel right, for example when you
use GEOS.

Caution: AMIGA mice look pretty much like C64 mice but the C64 core does not
support AMIGA mice, yet. The MEGA65 core does support AMIGA mice and this
feature is on our roadmap.

## 13) Can I use cartridges?

Yes, from
[Version 5](https://files.mega65.org?id=896a012f-59e4-456c-b91f-7e989b958241)
on, the core supports both real
[hardware cartridges](README.md#hardware-cartridges) that
you can insert into the MEGA65's Expansion Port and
[simulated cartridges](README.md#simulated-cartridges)
that you can load as `*.crt` files from your SD card.

The core is able to run more than 99% of all game
cartridges.

### Do not do a "hard-reset" when working with cartridges

If you are not sure what the difference between a "hard-reset" (aka
"long-reset") and a "soft-reset" (aka "short-reset") is, then
[please read here](README.md#hard-reset-vs-soft-reset). You will recognize a
hard-reset when the power LED of the MEGA65 turns blue.

Do not use hard-reset reset for any hardware cartridge. Instead always use the
soft-reset. Otherwise you will experience very odd behavior.

This is by design: We are masking the "CBM80" signature on "hard-reset". In the
previous core versions (before Version 5.1), there was a bug in our hard-reset
implementation that prevented you from leaving games like Uridium or Eagles
Nest via hard-reset. Now, from Version 5.1 on, hard-reset is fixed that means
each cartridge that relies on the "CBM80" signature will not work properly when
you use hard-reset. Not all cartridges rely on this signature. Learn more
about this signature by
[reading this article](http://tech.guitarsite.de/cbm80.html) and learn more
about how we implemented the hard-reset by
[reading this German C64 Wiki article](https://www.c64-wiki.de/wiki/Reset-Taster ).

### If only very few cartridges are working, you need to update CORE #0

This section is only relevant for machines that have been built before 2024.

If only some original retro cartridges are working but the vast majority
of modern cartridges are not working then it is very likely that you need
a so called "CORE #0 update" or that you need to use a slightly scary,
yet kind-of save workaround.

To check if this is the case: Press the <kbd>Help</kbd> key while you
experience the "not working" situation. If the
[well-known C64 for MEGA65 menu](doc/demopics/c64mega65-1.jpg)
is not being shown after you pressed <kbd>Help</kbd>, then instead of the
dedicated C64 core, the standard MEGA65 core is currently running which
is the reason why your hardware cartridge is not working.

Here is why: The core in slot #0 (which is the MEGA65 core) decides, which
core needs to be started if a hardware cartridge is inserted into the MEGA65's
Expansion Port. The old version that most of the MEGA65 have installed is
buggy and needs to be updated.

[Learn how to update or how to use a workaround here](README.md#core-0-update).
And if you are interested in the technical details about how your MEGA65
handles the whole multi core functionality during startup, then
[head to this MEGA65 Wiki article](https://mega65.atlassian.net/wiki/spaces/MEGA65/pages/158924822/MEGA65+System+Startup+Flow).

### My hardware freezer or flash cartridge does not work

The core does support certain sophisticated hardware cartridges such
as the Action Replay, EasyFlash 1CR, EasyFlash 3, Epyx Fast Load,
Final Cartridge III, Kung Fu Flash, PowerCartridge and Super Snapshot.
But they are not all created equal and you sometimes need to apply
work-arounds to make them work.

Make sure you read the
[dedicated hardware cartridge documentation](doc/cartridges.md)
to learn more and **exactly** follow the instructions there.

### A certain simulated freezer (`*.crt`) does not work

While Version 5.1 - the most recent version of the core - does support
quite a bunch of **hardware** freezer and flash cartridges very well,
support for **simulated** (`*.crt`) freezer cartridges is still in
its infancy.

[This is a list of known issues](https://github.com/MJoergen/C64MEGA65/issues?q=is%3Aissue+is%3Aopen+simcrt)
when it comes to **simulated** (`*.crt`) freezer cartridges.

### "Homebrew" cartridges: Never insert a barebone PCB

Always make sure that you insert a cartridge that is
[housed in a proper case](doc/cartridges.md#cartridge-cases) and never
insert a barebone PCB into the MEGA65's Expansion Port.

### Rare case: Zeta Wing cartridge is not working (maybe also relevant for other Protovision cartridges)

There is [a very detailed story on Discord](https://discord.com/channels/719326990221574164/794775503818588200/1222651625475149834)
written by AmokPhaze101 which has proven evidence, that his Zeta Wing
cartridge by Protovision had a faulty SN74HC02N chip: Replacing this chip lead
to the cartridge working like a charme.

This chip is rather easy to replace if you know how to solder. You can google
something like `buy SN74HC02N`, the chip is roundabout 1 EUR or $1.

There is no evidence that other Protovision cartridges are affected by this,
but just in case you stumble into a non-working Protovision cartridge and
you are already running a proper MEGA65 CORE #0 version on your machine
(see above), then replacing the SN74HC02N might be your next step.

## 14) Can I use IEC devices?

Yes, from Version 5 on, you can connect floppy drives (such as the original
1541 and 1581), hard disks, printers, plotters or modern devices such as the
SD2IEC and the Ultimate-II+ to your MEGA65. All CBM-Bus/IEEE-488 bus/IEC Bus
compliant devices are supposed to work.

### Avoid device number conflicts

The core uses device number #8 for the built-in simulated 1541 that can
mount `*.d64` files. So you need to ensure that no other drive uses #8 and
that all the device numbers you use are correct.
[Learn more here](https://www.c64-wiki.com/wiki/Device_number) and make
sure you activate the feature using the menu item "IEC: Use hardware port"
if you want to use.

### Switch-off HDMI: Flicker-free

The "HDMI: Flicker-free" mode
[very slightly changes the timing of the C64](README.md#flicker-free-hdmi).
While this is not a problem most of the time, it does lead to timing problems
with certain games (for example Rainbow Arts games on original 5 1/4"
disks) that are loaded via real 1541 floppys connected via the IEC port
to the MEGA65. Just to make sure that there are no misunderstandings: 
We are talking about real 1541 hardware here. Loading games via `*.d64`
disk images is **not** affected by "HDMI: Flicker-free" and also loading
games via an SD2IEC connected to the IEC port of the MEGA65 is also
not affected.

If you encounter incompatibilities when you load via real devices
connected to the IEC port, then switch-off "HDMI: Flicker-free" mode.

But in this case we would advise you heavily to also use an analog
retro monitor, because with "HDMI: Flicker-free" OFF, the output on HDMI
will be slightly jerky due to the misalignment of the C64's retro
output frequency and the frequencies that modern HDMI monitors are
actually able to display.
[Learn more here](README.md#flicker-free-hdmi).

## 15) How many files in a folder can the file browser handle?

The file browser can handle about 25,000 characters. If we assume an average
length of a filename (including the file extension) of 40 characters then this
means 25,000 / 40 = 625 files.

You might find
[this bash script](https://github.com/MJoergen/C64MEGA65/blob/master/M2M/tools/mover.sh)
helpful. You can run it inside a folder with a lot of files and afterwards you
have a directory structure `a .. z` and the files are moved there by name,
plus you will have a folder called `0` where all the files that start with
digits are. Don't forget to go to the folder `m` and remove `mover.sh`.

## 16) The core is not remembering my settings

Make sure that you have a `/c64` folder on your SD card and make sure that
you copy the `c64mega65` file that came with the
[ZIP file that contains Version 5.1](https://files.mega65.org?id=896a012f-59e4-456c-b91f-7e989b958241)
to this very folder.

When going from an older version of the C64 core to a newer version
(for example from Version 4 to Version 5.1) you always need to overwrite your
old `c64mega65` file by the new one that came with the
[ZIP file](https://files.mega65.org?id=896a012f-59e4-456c-b91f-7e989b958241).

Important: Even if you have a `c64/c64mega65` file on your SD card: The core will
not save any settings in case you switched between SD cards during a certain session.
Next time you power-on the core, it will resume saving the settings until you switch
between SD cards for the next time.
[Learn more details here](README.md#config-file).

Currently, we cannot automate this manual chore and need to ask users to copy the
`c64mega65` file.
[Track our efforts](https://github.com/MJoergen/C64MEGA65/issues/16) to change
this by following
[this GitHub issue](https://github.com/MJoergen/C64MEGA65/issues/16).

## 17) How can I work with GEOS?

GEOS works very well on the MEGA65 using Version 5.1 of the core. AmokPhaze101 wrote
a great step-by-step documentation:

1. Download GEOS [using this download link](https://github.com/MJoergen/C64MEGA65/raw/master/doc/assets/geos.zip)
2. Work with AmokPhaze101's tutorial: [View and download PDF](https://github.com/MJoergen/C64MEGA65/blob/master/doc/GEOS_WITH_THE_C64_CORE.pdf)
3. Learn how to use the [Real Time Clock](doc/RTC.md)

## 18) What do the two LEDs signal?

The MEGA65 has two LEDs above the keyboard. One is labeled "Power" and one is
labeled "Drive":

* Both leds blinking like ambulance lights: The core has a fatal error.
* Power green: Machine is powered on, core is running.
* Power blue: You pressed the reset button long enough to initiate a so
  called "Hard-reset" [(learn more)](README.md#hard-reset-vs-soft-reset).
* Drive off: No access to simulated 1541 drive.
* Drive green: The currently running C64 software is reading from or writing
  to the simulated 1541 drive.
* Drive blinking green: The last read/write operation to the simulated 1541
  drive failed.
* Drive yellow: The C64 core is writing changes made by the simulated 1541
  drive to the disk image file (`*.d64`) on the SD card.
  [Learn more](https://github.com/MJoergen/C64MEGA65/blob/V5.1-release/README.md#writing-to-disk-images)
  about how this mechanism works.

## 19) Which features are on the roadmap?

[Here](ROADMAP.md) is the roadmap for future versions. Additionally, there are also 
[feature requests](https://github.com/MJoergen/C64MEGA65/issues?q=is%3Aopen+is%3Aissue+label%3Aenhancement)
that we might consider for future releases.

## 20) Where can I post and discuss my feature request?

[Engage with us on GitHub](https://github.com/MJoergen/C64MEGA65/issues) or in the
[#c64-core](https://discord.com/channels/719326990221574164/794775503818588200) channel
on Discord to discuss feature requests and the future of the C64 for MEGA65 core.

## 21) Are there cores other than the C64 available or in development?

Yes. Please visit this website, it contains a list of MEGA65 cores that
will be constantly updated:

https://sy2002.github.io/m65cores/

If you are interested in making your own core or in porting cores from other
projects such as MiSTer: The website is also sharing additional information
about how to get started with doing this and about the
[MiSTer2MEGA65 framework](https://github.com/sy2002/MiSTer2MEGA65).

## 22) I am a total newby and want to learn FPGA development and making or porting cores

If you own a MEGA65, then
[this short article](https://files.mega65.org?ar=898d573b-d30d-4438-8893-09455bd16400)
is a smooth start to FPGA development. It uses some of the tutorials of the
[MiSTer2MEGA65 framework](https://github.com/sy2002/MiSTer2MEGA65)
and some resources from the web to get you started.

Moreover, the
[Learning Resources for FPGA Development](https://discord.com/channels/719326990221574164/1180179132668203118)
post on Discord is a great place to meet likeminded people and to ask questions.

[Download and read](https://github.com/sy2002/MiSTer2MEGA65/blob/master/doc/wiki/assets/FPGAs_VHDL_First_Steps_v2p3.pdf)
Helen DeBlumont's beginner "FPGAs with VHDL: First Steps" or go deep by working through the textbook
[The Designer's Guide to VHDL](https://picture.iczhiku.com/resource/eetop/sYiEyoAUyiEkPBBb.pdf)
by Peter J. Ashenden.
