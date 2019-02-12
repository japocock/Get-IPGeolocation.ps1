# Get-IPGeolocation.ps1
PowerShell script to perform a REST API query to get IP address geo-location information

## Parameters

- -IP
Specifies the IP address to lookup.

## Examples
```
.\Get-IPGeolocation.ps1 -IP 8.8.8.8
```

## Credits
Originally written by: Paul Cunningham. Fixed for 2019 by japocock.

Change Log
V1.00, 13/03/2015 - Initial version
V2.0, 12/02/2019 - Fixed for 2019
- Now references https://ipstack.com/
- Variable for IP key (free for 10.000 requests per month)
- Using the IPAddress class for variable.