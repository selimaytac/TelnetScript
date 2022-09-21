Install-Module -Name ImportExcel -Scope CurrentUser
$telnet = Import-Excel telnet.xlsx

"------------------------------------------`nScript Started Date => $(Get-Date) `n------------------------------------------" | Out-File Telnet-Results.txt -Append
"------------------------------------------`nScript Started Date => $(Get-Date) `n------------------------------------------" | Out-File Telnet-Errors.txt -Append
foreach ($server in $telnet) {
    try {
        $connection = New-Object System.Net.Sockets.TcpClient($server.Site, $server.Port)
        if ($connection.Connected) {
            Write-Host $server.Site "|" $server.Port "=> Success" 
            Out-File "Telnet-Results.txt" -InputObject "$($server.Site) - $($server.Port) => Success" -Append
        }
        else { 
            Write-Host $server.Site "|" $server.Port "=> Failed" 
            Out-File "Telnet-Results.txt" -InputObject "$($server.Site) - $($server.Port) => Failed" -Append
            Out-File "Telnet-Errors.txt" -InputObject "$($server.Site) - $($server.Port) => Failed" -Append
        }
    }
    catch [Exception] {
        Write-Host $server.Site "|" $server.Port "=> Timeout" 
        # Write-Host $_.Exception.GetType().FullName 
        # Write-Host $_.Exception.Message 
        Out-File "Telnet-Results.txt" -InputObject "$($server.Site) - $($server.Port) => Timeout" -Append
        Out-File "Telnet-Errors.txt" -InputObject "$($server.Site) - $($server.Port) => $($_.Exception.GetType().FullName) | $($_.Exception.Message) " -Append
    }
}
"------------------------------------------ `n" | Out-File Telnet-Results.txt -Append
"------------------------------------------ `n" | Out-File Telnet-Errors.txt -Append
