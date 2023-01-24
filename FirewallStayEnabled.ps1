$firewall = Get-NetFirewallProfile

if ($firewall.Enabled -eq "True") {
    # 
    New-Item -Path "HKLM:\Software\FirewallStayEnabled" -Name "isEnabled" -Value "True" -Force
    # Schedule a task to ensure firewall stays enabled every night at 10 PM
    $action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "-Command `"Set-NetFirewallProfile -Enabled True`""
    $trigger = New-ScheduledTaskTrigger -Daily -At 10pm
    $principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount
    Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -TaskName "FirewallStayEnabled" -Description "Ensures firewall stays enabled"
}
else {
    # Create registry key to track that firewall's status
    New-Item -Path "HKLM:\Software\FirewallStayEnabled" -Name "isEnabled" -Value "False" -Force
}
