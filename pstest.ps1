param (
    [Parameter(Mandatory=$true)][string]$WorkerServiceUrl,
    [Parameter(Mandatory=$true)][string]$UpdateProgressUrl
    
 )
 
 Write-Host $WorkerServiceUrl
 Write-Host $UpdateProgressUrl
 Write-Host $WorkerServiceUrl$UpdateProgressUrl
 
$i=1
While ($i -le 10)
{
    $progress = @{
      value=$i*10
    }
   $body = $progress | ConvertTo-Json 
   Write-Host $body
  
   Invoke-RestMethod $WorkerServiceUrl$UpdateProgressUrl -Method Post -Body $body -ContentType 'application/json'
   
   
   
   Start-Sleep -s 1

   $i++
}

   
   