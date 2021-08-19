
#!/usr/bin/env powershell

using namespace System.IO

$SourceFile = Resolve-Path $args[0]
$DirName = [Path]::GetDirectoryName($SourceFile)
$FileNameNoExtension = [Path]::GetFileNameWithoutExtension($SourceFile)
$DestinationPath = Join-Path "$DirName" "$FileNameNoExtension" 


$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$DestinationPath.lnk")
$Shortcut.TargetPath = "$SourceFile"
$Shortcut.Save()