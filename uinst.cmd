@rem Do not use "echo off" to not affect any child calls.
@setlocal
@rem Get the abolute path to the parent directory, which is assumed to be the
@rem MUCMD installation root.
@echo Removing Cmder Here from directory right click menu ...
@REG DELETE "HKCU\Software\Classes\Directory\shell\CmderHere\command" /f
@REG DELETE "HKCU\Software\Classes\Directory\shell\CmderHere" /f

@REG DELETE "HKCU\Software\Classes\Directory\Background\shell\CmderHere\command" /f
@REG DELETE "HKCU\Software\Classes\Directory\Background\shell\CmderHere" /f

@REG DELETE "HKCU\Software\Classes\*\shell\CmderHere\command" /f
@REG DELETE "HKCU\Software\Classes\*\shell\CmderHere" /f

@REG DELETE "HKCR\Directory\shell\CmderHere\command" /f
@REG DELETE "HKCR\Directory\shell\CmderHere" /f

@REG DELETE "HKCR\Directory\Background\shell\CmderHere\command" /f
@REG DELETE "HKCR\Directory\Background\shell\CmderHere" /f

@REG DELETE "HKCR\*\shell\CmderHere\command" /f
@REG DELETE "HKCR\*\shell\CmderHere" /f
