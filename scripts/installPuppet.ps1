echo "==== Install Puppet ===="

echo "Change DNS domain suffix ..."
$computerName = $env:computername
$DNSSuffix = "vagrant.local"
$oldDNSSuffix = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\" -Name "Domain")."Domain"

Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\" -Name Domain -Value $DNSSuffix
Set-DnsClientGlobalSetting -SuffixSearchList $oldDNSSuffix,$DNSSuffix

echo "Download puppet ..."
$url = "https://downloads.puppetlabs.com/windows/puppet-agent-1.10.1-x64.msi"
$output = "C:\install_puppet.msi"
Invoke-WebRequest -Uri $url -OutFile $output

echo "Install Puppet ..."
Start-Process -FilePath  msiexec -ArgumentList "/qn /norestart /i $output" -Wait

echo "Done."

