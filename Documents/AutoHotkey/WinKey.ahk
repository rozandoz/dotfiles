#NoTrayIcon

RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 1

^#l::
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 0
DllCall("LockWorkStation")
Reload

#h::Send #{Left}
#j::Send #{Down}
#k::Send #{Up}
#l::Send #{Right}
