<#
.SYNOPSIS
Get-IPGeolocation.ps1 - Get IP address geolocation data
.DESCRIPTION 
This PowerShell script performs a REST API query to retrieve
geolocation information for an IP address.
.OUTPUTS
Results are output to the console.
.PARAMETER IP
Specifies the IP address to lookup.
.EXAMPLE
.\Get-IPGeolocation.ps1 -IP 8.8.8.8
.NOTES
Originally written by: Paul Cunningham. Fixed for 2019 by japocock.
Change Log
V1.00, 13/03/2015 - Initial version
V2.0, 12/02/2019 - Fixed for 2019 by japocock.
- Now references https://ipstack.com/
- Variable for IP key (free for 10.000 requests per month)
- Using the IPAddress class for variable.
#>
function Get-IPGeolocation {  
    Param
    (
        [Parameter( Mandatory = $true)]
        [System.Net.IPAddress]$ipaddress,
        [string]$apikey = "XXXXXXXXXXXXXXXXXXXX"
    
    )
    $ipstring = $ipaddress.IPAddressToString
    $URI = "http://api.ipstack.com/$ipstring" + "?access_key=$apikey"
    $EscapedURI = [uri]::EscapeUriString($URI)
    $ipstackapicall = Invoke-RestMethod -Method Get -URI $EscapedURI

    $hash = @{
        ip             = $ipstackapicall.ip
        type           = $ipstackapicall.type
        continent_code = $ipstackapicall.continent_code
        continent_name = $ipstackapicall.continent_name
        country_code   = $ipstackapicall.country_code
        country_name   = $ipstackapicall.country_name
        region_code    = $ipstackapicall.region_code
        region_name    = $ipstackapicall.region_name
        city           = $ipstackapicall.city
        zip            = $ipstackapicall.zip
        latitude       = $ipstackapicall.latitude
        longitude      = $ipstackapicall.longitude
        location       = $ipstackapicall.location
    }

    $result = New-Object PSObject -Property $hash

    return $result
}

