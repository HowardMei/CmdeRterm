@rem Do not use "echo off" to not affect any child calls.
@setlocal
@rem Get the abolute path to the parent directory, which is assumed to be the
@rem Official regkey: [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\Background\OpenWithMobaXterm]
@rem Reg Key Roots: HKLM | HKCU | HKCR | HKU | HKCC
@for /F "delims=" %%I in ("%~dp0") do @set CmdeRterm_ROOT=%%~fI
@setx CMDER_ROOT "%CmdeRterm_ROOT%"
@if not exist "%ConEmuDir%" @set ConEmuDir="%CmdeRterm_ROOT%vendor\conemu-maximus5"
@setx ConEmuDir "%ConEmuDir%"
@if not exist "%ConEmuBaseDir%" @set ConEmuBaseDir="%CmdeRterm_ROOT%vendor\conemu-maximus5\ConEmu"
@setx ConEmuBaseDir "%ConEmuBaseDir%"

@echo Registering Cmder Here to directory right click menu ...
@REG ADD "HKCU\Software\Classes\Directory\shell\CmderHere" /t REG_SZ /d "Cmder Here" /f
@REG ADD "HKCU\Software\Classes\Directory\shell\CmderHere" /v "Icon" /t REG_SZ /d "%CmdeRterm_ROOT%icons\cmder.ico" /f
@REG ADD "HKCU\Software\Classes\Directory\shell\CmderHere\command" /f
@REG ADD "HKCU\Software\Classes\Directory\shell\CmderHere\command" /t REG_SZ /d "\"%ConEmuDir%\ConEmu.exe\" /Dir %%v /Single /icon \"%CmdeRterm_ROOT%\icons\cmder.ico\" /cmd \"cmd.exe /k \"%ConEmuBaseDir%\CmdInit.cmd\" -new_console:a\"" /f

@REG ADD "HKCU\Software\Classes\Directory\Background\shell\CmderHere" /t REG_SZ /d "Cmder Here" /f
@REG ADD "HKCU\Software\Classes\Directory\Background\shell\CmderHere" /v "Icon" /t REG_SZ /d "%CmdeRterm_ROOT%icons\cmder.ico" /f
@REG ADD "HKCU\Software\Classes\Directory\Background\shell\CmderHere\command" /f
@REG ADD "HKCU\Software\Classes\Directory\Background\shell\CmderHere\command" /t REG_SZ /d "\"%ConEmuDir%\ConEmu.exe\" /Dir %%v /Single /icon \"%CmdeRterm_ROOT%\icons\cmder.ico\" /cmd \"cmd.exe /k \"%ConEmuBaseDir%\CmdInit.cmd\" -new_console:a\"" /f

@REG ADD "HKCU\Software\Classes\*\shell\CmderHere" /t REG_SZ /d "Cmder Here" /f
@REG ADD "HKCU\Software\Classes\*\shell\CmderHere" /v "Icon" /t REG_SZ /d "%CmdeRterm_ROOT%icons\cmder.ico" /f
@REG ADD "HKCU\Software\Classes\*\shell\CmderHere\command" /f
@REG ADD "HKCU\Software\Classes\*\shell\CmderHere\command" /t REG_SZ /d "\"%ConEmuDir%\ConEmu.exe\" /Dir %%v /Single /icon \"%CmdeRterm_ROOT%\icons\cmder.ico\" /cmd \"cmd.exe /k \"%ConEmuBaseDir%\CmdInit.cmd\" -new_console:a\"" /f

@REG ADD "HKCR\Directory\shell\CmderHere" /t REG_SZ /d "Cmder Here" /f
@REG ADD "HKCR\Directory\shell\CmderHere" /v "Icon" /t REG_SZ /d "%CmdeRterm_ROOT%icons\cmder.ico" /f
@REG ADD "HKCR\Directory\shell\CmderHere\command" /f
@REG ADD "HKCR\Directory\shell\CmderHere\command" /t REG_SZ /d "\"%ConEmuDir%\ConEmu.exe\" /Dir %%v /Single /icon \"%CmdeRterm_ROOT%\icons\cmder.ico\" /cmd \"cmd.exe /k \"%ConEmuBaseDir%\CmdInit.cmd\" -new_console:a\"" /f

@REG ADD "HKCR\Directory\Background\shell\CmderHere" /t REG_SZ /d "Cmder Here" /f
@REG ADD "HKCR\Directory\Background\shell\CmderHere" /v "Icon" /t REG_SZ /d "%CmdeRterm_ROOT%icons\cmder.ico" /f
@REG ADD "HKCR\Directory\Background\shell\CmderHere\command" /f
@REG ADD "HKCR\Directory\Background\shell\CmderHere\command" /t REG_SZ /d "\"%ConEmuDir%\ConEmu.exe\" /Dir %%v /Single /icon \"%CmdeRterm_ROOT%\icons\cmder.ico\" /cmd \"cmd.exe /k \"%ConEmuBaseDir%\CmdInit.cmd\" -new_console:a\"" /f

@REG ADD "HKCR\*\shell\CmderHere" /t REG_SZ /d "Cmder Here" /f
@REG ADD "HKCR\*\shell\CmderHere" /v "Icon" /t REG_SZ /d "%CmdeRterm_ROOT%icons\cmder.ico" /f
@REG ADD "HKCR\*\shell\CmderHere\command" /f
@REG ADD "HKCR\*\shell\CmderHere\command" /t REG_SZ /d "\"%ConEmuDir%\ConEmu.exe\" /Dir %%v /Single /icon \"%CmdeRterm_ROOT%\icons\cmder.ico\" /cmd \"cmd.exe /k \"%ConEmuBaseDir%\CmdInit.cmd\" -new_console:a\"" /f
