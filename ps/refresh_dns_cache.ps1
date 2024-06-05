
function time {
    Param(
        [Parameter(Mandatory=$true)]
        [string]$command,
        [switch]$quiet = $false
    )
    $starttime = Get-Date
    try {
        if ( -not $quiet ) {
            iex $command | Write-Host
        } else {
            # iex $command > $null
            iex $command 2>&1 > $null
        }
    } finally {
		# $endtime = Get-Date
        # ($endtime - $starttime).TotalMilliseconds
        echo ($(Get-Date) - $starttime).TotalMilliseconds
    }
}


while (1) {
    cls
    echo "Running a nslooup command to all domains every n seconds .."
    foreach($line in Get-Content .\domains.txt) {
        echo $line
        
        # $stime=Get-Date;
        # echo $stime
        # nslookup $line 2>&1 > $null
        # time -q "nslookup $line"
        # time -q "C:\Vinicius\bin\cygwin64\bin\timeout_cyg.exe .1s nslookup $line"
        # C:\Vinicius\bin\cygwin64\bin\timeout_cyg.exe .5s nslookup $line 2>&1 > $null
        # $etime=Get-Date; 
        # echo $etime
        # ($etime - $stime).TotalSeconds
        # ($etime - $stime).TotalMilliseconds
        iwr -TimeoutSec 2 $line | findstr "StatusCode"
    #}
    
    # Get-Content C:\Vinicius\scripts\batch\domains.txt | ForEach-Object -Parallel {
        # iwr -TimeoutSec 2 $_ | findstr "StatusCode"
        # echo $_
    }
    
    # Get-Content "C:\Vinicius\scripts\batch\domains.txt" | ForEach-Object -Parallel { echo $_ }
    # Get-Content C:\Vinicius\scripts\batch\domains.txt | ForEach-Object -Parallel { iwr -TimeoutSec 2 $_ | Select-Object StatusCode }
    

    sleep 1
}


