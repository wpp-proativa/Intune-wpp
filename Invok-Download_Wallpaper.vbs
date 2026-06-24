Set objShell = CreateObject("WScript.Shell")

command = "powershell.exe -ExecutionPolicy Bypass -File ""C:\Wallpaper\Download_Wallpaper.ps1"""
objShell.Run command, 0, False
