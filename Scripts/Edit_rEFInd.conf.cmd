@echo off
rem Find free letter and give it for EFI partition
@for %%a in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do @if not exist %%a:\ set EFIDRIVE=%%a
rem Mount EFI partition
mountvol %EFIDRIVE%: /s
rem Open rEFInd.conf for editing with Notepad++
npp %EFIDRIVE%:\EFI\refind\refind.conf
rem Unmount EFI partition
mountvol %EFIDRIVE%: /d
