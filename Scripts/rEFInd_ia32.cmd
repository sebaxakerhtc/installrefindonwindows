@echo off
rem Download the latest version of rEFInd from souceforge
wget --no-check-certificate https://sourceforge.net/projects/refind/files/latest/download/refind.zip
rem Extracting
unzip refind.zip
rem goto unziped folder
cd refind-*
rem rename sample configuration file
ren refind\refind.conf-sample refind.conf
rem Find free letter and give it for EFI partition
@for %%a in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do @if not exist %%a:\ set EFIDRIVE=%%a
rem Mount EFI partition
mountvol %EFIDRIVE%: /s
rem Copy refind folder to EFI
xcopy refind %EFIDRIVE%:\efi\refind /s /I /y
rem Unmount EFI partition
mountvol %EFIDRIVE%: /d
rem Set rEFInd as default efi file
bcdedit /set "{bootmgr}" path \EFI\refind\refind_ ia32.efi
rem Restart Windows for test
shutdown -r
