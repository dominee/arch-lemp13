# Hardware Information

## inxi 

Output of `inxi -Fxz`:

```
System:
  Kernel: 6.11.9-arch1-1 arch: x86_64 bits: 64 compiler: gcc v: 14.2.1
  Desktop: Hyprland v: 0.45.1 Distro: Arch Linux
Machine:
  Type: Laptop System: System76 product: Lemur Pro v: lemp13
    serial: <superuser required>
  Mobo: System76 model: Lemur Pro v: lemp13 serial: <superuser required>
    UEFI: coreboot v: 2024-04-29_15016a0 date: 04/05/2024
Battery:
  ID-1: BAT0 charge: 68.9 Wh (94.5%) condition: 72.9/72.0 Wh (101.2%)
    volts: 15.4 min: 15.4 model: Notebook BAT status: not charging
CPU:
  Info: 12-core (2-mt/10-st) model: Intel Core Ultra 5 125U bits: 64
    type: MST AMCP arch: Meteor Lake rev: 4 cache: 12 MiB note: check
  Speed (MHz): avg: 400 min/max: 400/4300:3600:2100 cores: 1: 400 2: 400
    3: 400 4: 400 5: 400 6: 400 7: 400 8: 400 9: 400 10: 400 11: 400 12: 400
    13: 400 14: 400 bogomips: 75292
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx
Graphics:
  Device-1: Intel Meteor Lake-P [Intel Graphics] vendor: CLEVO/KAPOK
    driver: i915 v: kernel arch: Gen-13 bus-ID: 00:02.0
  Device-2: SunplusIT BisonCam NB Pro driver: uvcvideo type: USB
    bus-ID: 3-7:2
  Display: wayland server: Xwayland v: 24.1.4 compositor: Hyprland v: 0.45.1
    driver: gpu: i915 resolution: 1920x1200~60Hz
  API: EGL Message: EGL data requires eglinfo. Check --recommends.
Audio:
  Device-1: Intel Meteor Lake-P HD Audio driver: snd_hda_intel v: kernel
    bus-ID: 00:1f.3
  API: ALSA v: k6.11.9-arch1-1 status: kernel-api
  Server-1: sndiod v: N/A status: off
  Server-2: JACK v: 1.9.22 status: off
  Server-3: PipeWire v: 1.2.6 status: active
Network:
  Device-1: Intel Meteor Lake PCH CNVi WiFi driver: iwlwifi v: kernel
    bus-ID: 00:14.3
  IF: wlan0 state: up mac: <filter>
Bluetooth:
  Device-1: N/A driver: btusb v: 0.8 type: USB bus-ID: 3-10:3
  Report: btmgmt ID: hci0 rfk-id: 0 state: up address: <filter> bt-v: 5.3
    lmp-v: 12
Drives:
  Local Storage: total: 931.51 GiB used: 10.54 GiB (1.1%)
  ID-1: /dev/nvme0n1 vendor: Samsung model: SSD 990 PRO 1TB size: 931.51 GiB
    temp: 40.9 C
Partition:
  ID-1: / size: 927 GiB used: 10.41 GiB (1.1%) fs: btrfs dev: /dev/dm-0
    mapped: cryptoroot
  ID-2: /boot size: 511 MiB used: 142.1 MiB (27.8%) fs: vfat
    dev: /dev/nvme0n1p1
  ID-3: /home size: 927 GiB used: 10.41 GiB (1.1%) fs: btrfs dev: /dev/dm-0
    mapped: cryptoroot
  ID-4: /var/log size: 927 GiB used: 10.41 GiB (1.1%) fs: btrfs
    dev: /dev/dm-0 mapped: cryptoroot
  ID-5: /var/tmp size: 927 GiB used: 10.41 GiB (1.1%) fs: btrfs
    dev: /dev/dm-0 mapped: cryptoroot
Swap:
  ID-1: swap-1 type: zram size: 9.69 GiB used: 0 KiB (0.0%) dev: /dev/zram0
Sensors:
  System Temperatures: cpu: 63.0 C mobo: N/A
  Fan Speeds (rpm): cpu: 0
Info:
  Memory: total: 40 GiB note: est. available: 38.76 GiB used: 2.95 GiB (7.6%)
  Processes: 330 Uptime: 3h 19m Init: systemd
  Packages: 646 Compilers: gcc: 14.2.1 Shell: Zsh v: 5.9 inxi: 3.3.36
```

## dmidecode 

Output of `dmidecode`:

```
# dmidecode 3.6
Getting SMBIOS data from sysfs.
SMBIOS 3.3.0 present.
Table at 0xA7FBD5000.

Handle 0x0000, DMI type 0, 26 bytes
BIOS Information
	Vendor: coreboot
	Version: 2024-04-29_15016a0
	Release Date: 04/05/2024
	ROM Size: 32 MB
	Characteristics:
		PCI is supported
		PC Card (PCMCIA) is supported
		BIOS is upgradeable
		Selectable boot is supported
		ACPI is supported
		Targeted content distribution is supported
	BIOS Revision: 0.0
	Firmware Revision: 0.0

Handle 0x0001, DMI type 1, 27 bytes
System Information
	Manufacturer: System76
	Product Name: Lemur Pro
	Version: lemp13
	Serial Number: 123456789
	UUID: Not Settable
	Wake-up Type: Power Switch
	SKU Number: Not Specified
	Family: Not Specified

Handle 0x0002, DMI type 2, 14 bytes
Base Board Information
	Manufacturer: System76
	Product Name: Lemur Pro
	Version: lemp13
	Serial Number: 123456789
	Asset Tag: Not Specified
	Features: None
	Location In Chassis: Not Specified
	Chassis Handle: 0x0003
	Type: Motherboard

Handle 0x0003, DMI type 3, 22 bytes
Chassis Information
	Manufacturer: System76
	Type: Laptop
	Lock: Not Present
	Version: Not Specified
	Serial Number: Not Specified
	Asset Tag: Not Specified
	Boot-up State: Safe
	Power Supply State: Safe
	Thermal State: Safe
	Security Status: None
	OEM Information: 0x00000000
	Height: Unspecified
	Number Of Power Cords: 1
	Contained Elements: 0
	SKU Number: Not Specified

Handle 0x0004, DMI type 4, 48 bytes
Processor Information
	Socket Designation: CPU0
	Type: Central Processor
	Family: Pentium Pro
	Manufacturer: GenuineIntel
	ID: A4 06 0A 00 FF FB EB BF
	Signature: Type 0, Family 6, Model 170, Stepping 4
	Flags:
		FPU (Floating-point unit on-chip)
		VME (Virtual mode extension)
		DE (Debugging extension)
		PSE (Page size extension)
		TSC (Time stamp counter)
		MSR (Model specific registers)
		PAE (Physical address extension)
		MCE (Machine check exception)
		CX8 (CMPXCHG8 instruction supported)
		APIC (On-chip APIC hardware supported)
		SEP (Fast system call)
		MTRR (Memory type range registers)
		PGE (Page global enable)
		MCA (Machine check architecture)
		CMOV (Conditional move instruction supported)
		PAT (Page attribute table)
		PSE-36 (36-bit page size extension)
		CLFSH (CLFLUSH instruction supported)
		DS (Debug store)
		ACPI (ACPI supported)
		MMX (MMX technology supported)
		FXSR (FXSAVE and FXSTOR instructions supported)
		SSE (Streaming SIMD extensions)
		SSE2 (Streaming SIMD extensions 2)
		SS (Self-snoop)
		HTT (Multi-threading)
		TM (Thermal monitor supported)
		PBE (Pending break enabled)
	Version: Intel(R) Core(TM) Ultra 5 125U
	Voltage: 0.9 V
	External Clock: 100 MHz
	Max Speed: 4300 MHz
	Current Speed: 2700 MHz
	Status: Populated, Enabled
	Upgrade: Other
	L1 Cache Handle: 0x0006
	L2 Cache Handle: 0x0007
	L3 Cache Handle: 0x0008
	Serial Number: Not Specified
	Asset Tag: Not Specified
	Part Number: Not Specified
	Core Count: 7
	Core Enabled: 7
	Thread Count: 14
	Characteristics:
		Hardware Thread
		Execute Protection
		Enhanced Virtualization

Handle 0x0005, DMI type 7, 27 bytes
Cache Information
	Socket Designation: CACHE1
	Configuration: Enabled, Not Socketed, Level 1
	Operational Mode: Unknown
	Location: Internal
	Installed Size: 336 kB
	Maximum Size: 336 kB
	Supported SRAM Types:
		Unknown
	Installed SRAM Type: Unknown
	Speed: Unknown
	Error Correction Type: Unknown
	System Type: Data
	Associativity: 12-way Set-associative

Handle 0x0006, DMI type 7, 27 bytes
Cache Information
	Socket Designation: CACHE1
	Configuration: Enabled, Not Socketed, Level 1
	Operational Mode: Unknown
	Location: Internal
	Installed Size: 448 kB
	Maximum Size: 448 kB
	Supported SRAM Types:
		Unknown
	Installed SRAM Type: Unknown
	Speed: Unknown
	Error Correction Type: Unknown
	System Type: Instruction
	Associativity: 16-way Set-associative

Handle 0x0007, DMI type 7, 27 bytes
Cache Information
	Socket Designation: CACHE2
	Configuration: Enabled, Not Socketed, Level 2
	Operational Mode: Unknown
	Location: Internal
	Installed Size: 2 MB
	Maximum Size: 2 MB
	Supported SRAM Types:
		Unknown
	Installed SRAM Type: Unknown
	Speed: Unknown
	Error Correction Type: Unknown
	System Type: Unified
	Associativity: 16-way Set-associative

Handle 0x0008, DMI type 7, 27 bytes
Cache Information
	Socket Designation: CACHE3
	Configuration: Enabled, Not Socketed, Level 3
	Operational Mode: Unknown
	Location: Internal
	Installed Size: 0 kB
	Maximum Size: 0 kB
	Supported SRAM Types:
		Unknown
	Installed SRAM Type: Unknown
	Speed: Unknown
	Error Correction Type: Unknown
	System Type: Unified
	Associativity: 12-way Set-associative

Handle 0x0009, DMI type 16, 23 bytes
Physical Memory Array
	Location: System Board Or Motherboard
	Use: System Memory
	Error Correction Type: None
	Maximum Capacity: 128 GB
	Error Information Handle: Not Provided
	Number Of Devices: 2

Handle 0x000A, DMI type 17, 40 bytes
Memory Device
	Array Handle: 0x0009
	Error Information Handle: Not Provided
	Total Width: 64 bits
	Data Width: 64 bits
	Size: 8 GB
	Form Factor: SODIMM
	Set: None
	Locator: Channel-0-DIMM-0
	Bank Locator: BANK 0
	Type: DDR5
	Type Detail: Unknown Synchronous
	Speed: 4800 MT/s
	Manufacturer: Samsung
	Serial Number: 00000000
	Asset Tag: Channel-0-DIMM-0-AssetTag
	Part Number: M425R1GB4BB0-CQKOD
	Rank: 1
	Configured Memory Speed: 4800 MT/s
	Minimum Voltage: 1.1 V
	Maximum Voltage: 1.1 V
	Configured Voltage: 1.1 V

Handle 0x000B, DMI type 17, 40 bytes
Memory Device
	Array Handle: 0x0009
	Error Information Handle: Not Provided
	Total Width: 64 bits
	Data Width: 64 bits
	Size: 32 GB
	Form Factor: SODIMM
	Set: None
	Locator: Channel-0-DIMM-0
	Bank Locator: BANK 0
	Type: DDR5
	Type Detail: Unknown Synchronous
	Speed: 4800 MT/s
	Manufacturer: Unknown (4589)
	Serial Number: 00000091
	Asset Tag: Channel-0-DIMM-0-AssetTag
	Part Number: M425R1GB4BB0-CQKOD
	Rank: 2
	Configured Memory Speed: 4800 MT/s
	Minimum Voltage: 1.1 V
	Maximum Voltage: 1.1 V
	Configured Voltage: 1.1 V

Handle 0x000C, DMI type 19, 31 bytes
Memory Array Mapped Address
	Starting Address: 0x00000000000
	Ending Address: 0x009FFFFFFFF
	Range Size: 40 GB
	Physical Array Handle: 0x0009
	Partition Width: 2

Handle 0x000D, DMI type 20, 35 bytes
Memory Device Mapped Address
	Starting Address: 0x00000000000
	Ending Address: 0x001FFFFFFFF
	Range Size: 8 GB
	Physical Device Handle: 0x000A
	Memory Array Mapped Address Handle: 0x000C
	Partition Row Position: Unknown
	Interleave Position: Unknown
	Interleaved Data Depth: Unknown

Handle 0x000E, DMI type 20, 35 bytes
Memory Device Mapped Address
	Starting Address: 0x00200000000
	Ending Address: 0x009FFFFFFFF
	Range Size: 32 GB
	Physical Device Handle: 0x000A
	Memory Array Mapped Address Handle: 0x000C
	Partition Row Position: Unknown
	Interleave Position: Unknown
	Interleaved Data Depth: Unknown

Handle 0x000F, DMI type 32, 11 bytes
System Boot Information
	Status: No errors detected

Handle 0x0010, DMI type 41, 11 bytes
Onboard Device
	Reference Designation: VGA compatible controller
	Type: Video
	Status: Enabled
	Type Instance: 0
	Bus Address: 0000:00:02.0

Handle 0x0011, DMI type 133, 5 bytes
OEM-specific Type
	Header and Data:
		85 05 11 00 01
	Strings:
		KHOIHGIUCCHHII

Handle 0xFEFF, DMI type 127, 4 bytes
End Of Table
```
## lscpu 

Output of `lscpu`:

```
Architecture:                         x86_64
CPU op-mode(s):                       32-bit, 64-bit
Address sizes:                        46 bits physical, 48 bits virtual
Byte Order:                           Little Endian
CPU(s):                               14
On-line CPU(s) list:                  0-13
Vendor ID:                            GenuineIntel
Model name:                           Intel(R) Core(TM) Ultra 5 125U
CPU family:                           6
Model:                                170
Thread(s) per core:                   2
Core(s) per socket:                   12
Socket(s):                            1
Stepping:                             4
CPU(s) scaling MHz:                   42%
CPU max MHz:                          4300.0000
CPU min MHz:                          400.0000
BogoMIPS:                             5378.00
Flags:                                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb intel_ppin ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni vaes vpclmulqdq rdpid bus_lock_detect movdiri movdir64b fsrm md_clear serialize arch_lbr ibt flush_l1d arch_capabilities
Virtualization:                       VT-x
NUMA node(s):                         1
NUMA node0 CPU(s):                    0-13
Vulnerability Gather data sampling:   Not affected
Vulnerability Itlb multihit:          Not affected
Vulnerability L1tf:                   Not affected
Vulnerability Mds:                    Not affected
Vulnerability Meltdown:               Not affected
Vulnerability Mmio stale data:        Not affected
Vulnerability Reg file data sampling: Not affected
Vulnerability Retbleed:               Not affected
Vulnerability Spec rstack overflow:   Not affected
Vulnerability Spec store bypass:      Mitigation; Speculative Store Bypass disabled via prctl
Vulnerability Spectre v1:             Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:             Mitigation; Enhanced / Automatic IBRS; IBPB conditional; RSB filling; PBRSB-eIBRS Not affected; BHI BHI_DIS_S
Vulnerability Srbds:                  Not affected
Vulnerability Tsx async abort:        Not affected
```
## lspci

Output of `lspci -v`:

```
00:00.0 Host bridge: Intel Corporation Device 7d02 (rev 04)
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IOMMU group 1
	Capabilities: <access denied>
	Kernel driver in use: igen6_edac

00:02.0 VGA compatible controller: Intel Corporation Meteor Lake-P [Intel Graphics] (rev 08) (prog-if 00 [VGA controller])
	DeviceName: VGA compatible controller
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IRQ 190, IOMMU group 0
	Memory at bf000000 (64-bit, prefetchable) [size=16M]
	Memory at 3ffe0000000 (64-bit, prefetchable) [size=256M]
	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
	Capabilities: <access denied>
	Kernel driver in use: i915

00:06.0 PCI bridge: Intel Corporation Device 7eca (rev 10) (prog-if 00 [Normal decode])
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IRQ 122, IOMMU group 2
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: b2b00000-b2bfffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:07.0 PCI bridge: Intel Corporation Meteor Lake-P Thunderbolt 4 PCI Express Root Port #0 (rev 10) (prog-if 00 [Normal decode])
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IRQ 123, IOMMU group 3
	Bus: primary=00, secondary=02, subordinate=2c, sec-latency=0
	I/O behind bridge: f000-ffff [size=4K] [16-bit]
	Memory behind bridge: b2c00000-bedfffff [size=194M] [32-bit]
	Prefetchable memory behind bridge: 3ffc4000000-3ffdfffffff [size=448M] [32-bit]
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:0a.0 Signal processing controller: Intel Corporation Meteor Lake-P Platform Monitoring Technology (rev 01)
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: fast devsel, IOMMU group 4
	Memory at b29c0000 (64-bit, non-prefetchable) [size=256K]
	Capabilities: <access denied>
	Kernel driver in use: intel_vsec

00:0d.0 USB controller: Intel Corporation Meteor Lake-P Thunderbolt 4 USB Controller (rev 10) (prog-if 30 [XHCI])
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: medium devsel, IRQ 125, IOMMU group 5
	Memory at b2970000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: xhci_hcd

00:0d.2 USB controller: Intel Corporation Meteor Lake-P Thunderbolt 4 NHI #0 (rev 10) (prog-if 40 [USB4 Host Interface])
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IRQ 19, IOMMU group 5
	Memory at b2980000 (64-bit, non-prefetchable) [size=256K]
	Memory at b2953000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: thunderbolt

00:14.0 USB controller: Intel Corporation Meteor Lake-P USB 3.2 Gen 2x1 xHCI Host Controller (rev 20) (prog-if 30 [XHCI])
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: medium devsel, IRQ 133, IOMMU group 6
	Memory at b2960000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: xhci_hcd

00:14.2 RAM memory: Intel Corporation Device 7e7f (rev 20)
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IOMMU group 6
	Memory at b295c000 (64-bit, non-prefetchable) [size=16K]
	Memory at b2952000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>

00:14.3 Network controller: Intel Corporation Meteor Lake PCH CNVi WiFi (rev 20)
	Subsystem: Intel Corporation Wi-Fi 6E AX211 160MHz
	Flags: bus master, fast devsel, latency 0, IRQ 18, IOMMU group 7
	Memory at b2958000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: iwlwifi

00:15.0 Serial bus controller: Intel Corporation Meteor Lake-P Serial IO I2C Controller #0 (rev 20)
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IRQ 27, IOMMU group 8
	Memory at b2951000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel-lpss

00:15.1 Serial bus controller: Intel Corporation Meteor Lake-P Serial IO I2C Controller #1 (rev 20)
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IRQ 28, IOMMU group 8
	Memory at b2950000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel-lpss

00:19.0 Serial bus controller: Intel Corporation Meteor Lake-P Serial IO I2C Controller #4 (rev 20)
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IRQ 31, IOMMU group 9
	Memory at a87000000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel-lpss

00:19.1 Serial bus controller: Intel Corporation Meteor Lake-P Serial IO I2C Controller #5 (rev 20)
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IRQ 32, IOMMU group 9
	Memory at b294e000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel-lpss

00:1c.0 PCI bridge: Intel Corporation Device 7e38 (rev 20) (prog-if 00 [Normal decode])
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IRQ 124, IOMMU group 10
	Bus: primary=00, secondary=2d, subordinate=2d, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: b2a00000-b2afffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: <access denied>
	Kernel driver in use: pcieport

00:1f.0 ISA bridge: Intel Corporation Device 7e03 (rev 20)
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IOMMU group 11

00:1f.3 Audio device: Intel Corporation Meteor Lake-P HD Audio Controller (rev 20)
	Flags: bus master, fast devsel, latency 64, IRQ 191, IOMMU group 11
	Memory at b2954000 (64-bit, non-prefetchable) [size=16K]
	Memory at bee00000 (64-bit, non-prefetchable) [size=2M]
	Capabilities: <access denied>
	Kernel driver in use: snd_hda_intel

00:1f.4 SMBus: Intel Corporation Meteor Lake-P SMBus Controller (rev 20)
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: medium devsel, IRQ 20, IOMMU group 11
	Memory at b294c000 (64-bit, non-prefetchable) [size=256]
	I/O ports at efa0 [size=32]
	Kernel driver in use: i801_smbus

00:1f.5 Serial bus controller: Intel Corporation Meteor Lake-P SPI Controller (rev 20)
	Subsystem: CLEVO/KAPOK Computer Device 2624
	Flags: bus master, fast devsel, latency 0, IOMMU group 11
	Memory at b294d000 (32-bit, non-prefetchable) [size=4K]
	Kernel driver in use: intel-spi

01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller S4LV008[Pascal] (prog-if 02 [NVM Express])
	Subsystem: Samsung Electronics Co Ltd Device a801
	Flags: bus master, fast devsel, latency 0, IRQ 17, IOMMU group 12
	Memory at b2b00000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: nvme

2d:00.0 SD Host controller: O2 Micro, Inc. SD/MMC Card Reader Controller (rev 01) (prog-if 01)
	Subsystem: O2 Micro, Inc. Device 0002
	Flags: bus master, fast devsel, latency 0, IRQ 156, IOMMU group 13
	Memory at b2a00000 (32-bit, non-prefetchable) [size=4K]
	Memory at b2a01000 (32-bit, non-prefetchable) [size=2K]
	Capabilities: <access denied>
	Kernel driver in use: sdhci-pci
```

