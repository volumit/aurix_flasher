# aurix_flasher_tc3xx

Some people asked. Install https://www.infineon.com/DAS Download + Install DASV8.0 Based on MCD API C++ demo project

HOST PC (Windows/Linux) Target TC375 Lite Kit

Loads Target with a small routine to handle Erase of Sectors and Program Sectors Converts ihex into a virtual format Does handshaking with Target Is not optimized for speed.

$ ./aurix_flasher test.ihex

Enter name of MCD API lib (0 for mcdxdas.dll):
MCD Implementation Info
  Vendor:      Infineon Technologies
  Version:     1.14.1
  API version: 1.1
  Date:        Jun 22 2023


Running Servers
0: UDAS, Access HW: DAS JDS AURIX LITE KIT V2.0 (TC375) LK58AKEK


Open Servers

McdHostName="localhost"
McdServerName="UDAS"
McdExitIfLastClient=true
McdAccHw="DAS JDS AURIX LITE KIT V2.0 (TC375) LK58AKEK"
McdAccHw.AutoDetect=true
McdAccHw.DeviceId=0x10207083
McdAccHw.Device="TriCore-Family"
McdAccHw.Frequency=400000
McdAccHw.PostRstDelay=175


SYSTEM LEVEL ##################################################################
Found 1 systems on host localhost

MCD Core Connection Info
system:      Real HW


DEVICE LEVEL ##################################################################
Found 1 devices within system Real HW

MCD Core Connection Info
host:        localhost
server_port: 24817
system:      Real HW
acc_hw:      DAS JDS AURIX LITE KIT V2.0 (TC375) LK58AKEK
device_type: 0x10207083
device:      TC37x


CORE LEVEL ####################################################################
Found 3 cores within device TC37x

MCD Core Connection Info
host:        localhost
server_port: 24817
system:      Real HW
acc_hw:      DAS JDS AURIX LITE KIT V2.0 (TC375) LK58AKEK
device_type: 0x10207083
device:      TC37x
core:        Core 0: CPU0 TriCore 1.6P
core_type:   44
core_id:     0x00C0C021

MCD Core Connection Info
host:        localhost
server_port: 24817
system:      Real HW
acc_hw:      DAS JDS AURIX LITE KIT V2.0 (TC375) LK58AKEK
device_type: 0x10207083
device:      TC37x
core:        Core 1: CPU1 TriCore 1.6P
core_type:   44
core_id:     0x00C0C021

MCD Core Connection Info
host:        localhost
server_port: 24817
system:      Real HW
acc_hw:      DAS JDS AURIX LITE KIT V2.0 (TC375) LK58AKEK
device_type: 0x10207083
device:      TC37x
core:        Core 2: CPU2 TriCore 1.6P
core_type:   44
core_id:     0x00C0C021

Do Halt after Reset
IP 0xA0000000 State Debug
Do Frequency
Frequency set to 30000 kHz
IHEX flash_TC3xx.hex Loaded 1296 bytes
Write Memory addr=70000000 length=00000600
Status CPU0 3
Status CPU0 3
IHEX test.ihex Loaded 4194304 bytes
Load IHex FilE Done!
Time to Load in ms (Milliseconds) 3581
Erase Sector @addr=a0000000
...
Erase Sector @addr=a03fc000
Erase Done!
Time to Erase in ms (Milliseconds) 60856
Time to Program in ms (Milliseconds) 12275
