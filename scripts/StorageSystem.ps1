function Get-DSCCStorageSystem
{
<#
.SYNOPSIS
    Returns the HPE DSSC DOM Storage Systems Collection    
.DESCRIPTION
    Returns the HPE Data Services Cloud Console Data Operations Manager Storage Systems Collections;
.PARAMETER StorageSystemID
    If a single Storage System ID is specified the output will be limited to that single record.
.PARAMETER DeviceType
    This can either be set to Device-Type1 or Device-Type2, where Device-Type1 refers to 3PAR/Primera/Alletra9K, while Device-Type2 refers to NimbleStorage/Alletra9K.
.PARAMETER WhatIf
    The WhatIf directive will show you the RAW RestAPI call that would be made to DSCC instead of actually sending the request.
    This option is very helpful when trying to understand the inner workings of the native RestAPI calls that DSCC uses.
.EXAMPLE 
    PS:> Get-DSCCStorageSystem -DeviceType device-type1
    
    name                 id         type           model         fqdn       timezone        state  version
    ----                 --         ----           -----         ----       --------        -----  -------
    tmehou-pod1-primera2 2M2042059T primera-system HPE_3PAR A630 10.77.7.10 America/Chicago NORMAL 4.4.0.59
    tmehou-pod2-primera1 2M2042059X primera-system HPE_3PAR A630 10.77.7.2  America/Chicago NORMAL 4.4.0.59
    tmehou-pod3-primera1 2M2019018G primera-system HPE_3PAR A630 10.77.7.3  America/Chicago NORMAL 4.4.0.59
    tmehou-pod1-primera1 2M202205GG primera-system HPE_3PAR A630 10.77.7.1  America/Chicago NORMAL 4.4.0.59
.EXAMPLE
    PS:> Get-DSCCStorageSystem -DeviceType device-type2

    name                id                                         type  model          timezone        version_current
    ----                --                                         ----  -----          --------        ---------------
    tmehou-pod3-AF40    0006b878a5a008ec63000000000000000000000001 group AF40-2P2QF-11T America/Chicago 6.0.0.100-924305-opt
    tmehou-pod1-6050-gr 003be9f65d5b1de4fd000000000000000000000001 group 6050-4N2QY-46T America/Chicago 6.0.0.200-927971-opt
    tmehou-pod2-af40    000849204632ec0d70000000000000000000000001 group AF40-QP2QF-46T America/Chicago 6.0.0.200-927971-opt
.EXAMPLE
    PS:> Get-DSCCStorageSystem -DeviceType device-type1 | format-list

    systemWWN             : 2FF70002AC026AFD
    timezone              : America/Chicago
    id                    : 2M2042059T
    safeToRemove          : False
    centerplaneType       : 2 Node Centerplane
    deviceId              : 158461
    resourceUri           : /api/v1/storage-systems/device-type1/2M2042059T
    systemDate            : 1636050724
    displayname           : System tmehou-pod1-primera2
    overallState          : NORMAL
    name                  : tmehou-pod1-primera2
    maintenanceMode       :
    locateEnabled         : False
    minimumPasswordLength : 8
    nodeMemory            : 128
    nodesCount            : 2
    masterNode            : 0
    onlineNodes           : {0, 1}
    inClusterNodes        : {0, 1}
    nodesPresent          : {0, 1}
    clusterLED            : LED_GREEN
    deviceType            : @{default=HPE_3PAR A630; key=sys_type-67}
    type                  : primera-system
    customerId            : 0056b71eefc411eba26862adb877c2d8
    generation            : 1636050724281
    chunkletSizeMiB       : 1024
    fqdn                  : 10.77.7.10
    softwareVersions      : @{baseVersion=4.4.0; release=; patches=; fullVersion=4.4.0.59; components=System.Object[]}
    version               : @{display=4.4.0; base=4.4.0; full=4.4.0.59; fullWithoutPatches=4.4.0.59}
    sysLogStatus          :
    state                 : @{detailed=; overall=STATE_NORMAL}
    manufacturing         : @{assemblyRev=; checkSum=; hpeModelName=; saleablePartNumber=; saleableSerialNumber=;
                            sparePartNumber=; serialNumber=2M2042059T; model=HPE_3PAR A630; manufacturer=HPE}
    descriptors           : @{owner=; contact=Gerald Best, 8325021955, hou.tmealerts@hpe.com; comment=; location=}
    networkMasterNode     : 1
    uptime                : @{ms=1635601970000; tz=Local}
    domain                :
    associatedLinks       : {@{type=ports; resourceUri=/api/v1/storage-systems/device-type1/2M2042059T/ports},
                            @{type=storage-pools;
                            resourceUri=/api/v1/storage-systems/device-type1/2M2042059T/storage-pools},
                            @{type=applicationsets;
                            resourceUri=/api/v1/storage-systems/device-type1/2M2042059T/applicationsets},
                            @{type=supportsettings;
                            resourceUri=/api/v1/storage-systems/device-type1/2M2042059T/support-settings}...}
.EXAMPLE
    PS:> Get-DSCCStorageSystem -DeviceType1 device-type1 -SystemId 2M202205GG | convertTo-JSON
    
    {
    "systemWWN":  "2FF70002AC025F8B",
    "timezone":  "America/Chicago",
    "id":  "2M202205GG",
    "safeToRemove":  false,
    "centerplaneType":  "2 Node Centerplane",
    "deviceId":  155531,
    "resourceUri":  "/api/v1/storage-systems/device-type1/2M202205GG",
    "systemDate":  1638407162,
    "displayname":  "System tmehou-pod1-primera1",
    "overallState":  "NORMAL",
    "name":  "tmehou-pod1-primera1",
    "maintenanceMode":  null,
    "locateEnabled":  false,
    "minimumPasswordLength":  8,
    "nodeMemory":  "128",
    "nodesCount":  2,
    "masterNode":  0,
    "onlineNodes":  [
                        0,
                        1
                    ],
    "inClusterNodes":  [
                           0,
                           1
                       ],
    "nodesPresent":  [
                         0,
                         1
                     ],
    "clusterLED":  "LED_GREEN",
    "deviceType":  {
                       "default":  "HPE_3PAR A630",
                       "key":  "sys_type-67"
                   },
    "type":  "primera-system",
    "customerId":  "ffc311463d8711ecbdd5428607ee1704",
    "generation":  1638407162262,
    "chunkletSizeMiB":  1024,
    "fqdn":  "10.77.7.1",
    "softwareVersions":  {
                             "baseVersion":  "4.4.0",
                             "release":  "",
                             "patches":  "",
                             "fullVersion":  "4.4.0.59",
                             "components":  [
                                                "@{baseVersion=4.4.0; release=; fullVersion=4.4.0.59; name=CLI Server}",
                                                ...
                                                "@{baseVersion=16.29.1702; release=; fullVersion=16.29.1702; name=Mellanox CX-5 Firmware}"
                                            ]
                         },
    "version":  {
                    "display":  "4.4.0",
                    "base":  "4.4.0",
                    "full":  "4.4.0.59",
                    "fullWithoutPatches":  "4.4.0.59"
                },
    "sysLogStatus":  null,
    "state":  {
                  "detailed":  null,
                  "overall":  "STATE_NORMAL"
              },
    "manufacturing":  {
                          "assemblyRev":  null,
                          "checkSum":  null,
                          "hpeModelName":  null,
                          "saleablePartNumber":  null,
                          "saleableSerialNumber":  null,
                          "sparePartNumber":  null,
                          "serialNumber":  "2M202205GG",
                          "model":  "HPE_3PAR A630",
                          "manufacturer":  "HPE"
                      },
    "descriptors":  {
                        "owner":  "",
                        "contact":  "Gerald Best, 8325021955, hou.tmealerts@hpe.com",
                        "comment":  "",
                        "location":  ""
                    },
    "networkMasterNode":  1,
    "uptime":  {
                   "ms":  1637227068000,
                   "tz":  "Local"
               },
    "domain":  "",
    "associatedLinks":  [
                            {
                                "type":  "ports",
                                "resourceUri":  "/api/v1/storage-systems/device-type1/2M202205GG/ports"
                            },
                            ...
                            {
                                "type":  "swhistory",
                                "resourceUri":  "/api/v1/storage-systems/device-type1/2M202205GG/swupdate/history"
                            }
                        ]
}

.EXAMPLE
    PS:> Get-DSCCStorageSystem -WhatIf

    WARNING: You have selected the What-IF option, so the call will note be made to the array,
    instead you will see a preview of the RestAPI call

    The URI for this call will be
        https://scalpha-app.qa.cds.hpe.com/api/v1/storage-systems/device-type1
    The Method of this call will be
        Get
    The Header for this call will be :
        {   "Authorization":  "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IlhwRUVZUGlZWDVkV1JTeDR4SmpNcEVPc1hTSSIsInBpLmF0bSI6ImRlejAifQ.eyJjbGllbnRfaWQiOiIzZjIwODU4NS0zZGE2LTRiZjctOTRjYS00ZjMxMGQwOTYzYjUiLCJpc3MiOiJodHRwczovL3Nzby5jb21tb24uY2xvdWQuaHBlLmNvbSIsImF1ZCI6ImV4dGVybmFsX2FwaSIsInN1YiI6ImNocmlzLmxpb25ldHRpQGhwZS5jb20iLCJ1c2VyX2N0eCI6IjAwNTZiNzFlZWZjNDExZWJhMjY4NjJhZGI4NzdjMmQ4IiwiYXV0aF9zb3VyY2UiOiJjY3NfdG9rZW5fbWFuYWdlbWVudCIsInBsYXRmb3JtX2N1c3RvbWVyX2lkIjoiOGZmYzRiN2VlOWQyMTFlYjhjZWU2ZTEzYzA3MWVhMzciLCJpYXQiOjE2MzYwNjY4NzksImFwcGxpY2F0aW9uX2luc3RhbmNlX2lkIjoiM2MxOGJkMDMtODMwNi00YzdjLTk0MmUtYzcwNGE0Yjg3NDRjIiwiZXhwIjoxNjM2MDc0MDc5fQ.D38GnVgiQVgNl6TboQC8UOOq0CxlRPo6oEdiq7KnNAojZfrIZJ2bHkAqcqaua4aEB6Y5d2q-DCVf6DQjsKec2utfLHYv-cOEWzzx06dUk4B11fJaCsRWuLNT-NZjSqugUKpp22VBbFn5stUAs3_YXVIlR9x3UqYk9MGZW2QgQtqKjheD6msFiplgzx5g9RPqyViX24V0gNcIXVcRd36wb-Rr_wGP9X6ycy6fXhWtqkKc7c8aKcfwflKsgvcI7p4NIS2LGswuuTrTAspoNgAp-Io0ytsepnxZ6vEiJrxZHhLcL4zEBP-IV9ElsgS3ymMVfhT-uBZXdr1CfV9EHQ0Vgw"
        }
    The Body of this call will be:
        "No Body"
.LINK
#>   
[CmdletBinding()]
param(                                                                      [string]    $SystemId, 
        [parameter(mandatory,helpMessage="The Acceptable values are device-type1 or device-type2.")][validateset('device-type1','device-type2')]  
                                                                            [string]    $DeviceType,
                                                                            [switch]    $WhatIf
     )
process
    {   Invoke-DSCCAutoReconnect
        $MyURI = $BaseURI + 'storage-systems/' + $DeviceType
        if ( $WhatIf )
                {   $SysColOnly = invoke-restmethodWhatIf -uri $MyUri -headers $MyHeaders -method Get
                }   
            else 
                {   $SysColOnly = invoke-restmethod -uri $MyUri -headers $MyHeaders -method Get
                }
        if ( ($SysColOnly).items )  
                {   $SysColOnly = ($SysColOnly).items 
                }   
            else 
                {   if ( ($SysColOnly).total -eq 0 )
                        {   write-warning "No Items Returned"
                            $SysColOnly = ''
                        }
                }
        $ReturnData = Invoke-RepackageObjectWithType -RawObject $SysColOnly -ObjectName "StorageSystem.$DeviceType"
        if ( $SystemId )
                {   return ( $ReturnData | where-object { $_.id -eq $SystemId } )
                } 
            else 
                {   return $ReturnData
                }
    }       
}   

function Invoke-DSCCStorageSystemLocate
{
<#
.SYNOPSIS
    Initiates the HPE DSSC DOM Storage Systems Beacon for a specific Storage System. Only valid for Type1 Storage Systems (3PAR/Primera/Alletra9K)   
.DESCRIPTION
    Initiates the HPE Data Services Cloud Console Data Operations Manager Systems Beacon for a specific Storage System. 
    Only valid for Type1 Storage Systems (3PAR/Primera/Alletra9K)  
.PARAMETER StorageSystemID
    The single storage systems beacon light will be illuminated
.PARAMETER WhatIf
    The WhatIf directive will show you the RAW RestAPI call that would be made to DSCC instead of actually sending the request.
    This option is very helpful when trying to understand the inner workings of the native RestAPI calls that DSCC uses.
.EXAMPLE
    PS:> Invoke-DSCCStorageSystemLocate -StorageSystemId 2M234353456TZ
.EXAMPLE
    PS:> InvokeDSCCStorageSystemLocate -StorageSystemId 2M234353456TZ -whatif

    WARNING: You have selected the What-IF option, so the call will note be made to the array,
    instead you will see a preview of the RestAPI call

    The URI for this call will be
        https://scalpha-app.qa.cds.hpe.com/api/v1/storage-systems/device-type1/2M345667YZ
    The Method of this call will be
        Post
    The Header for this call will be :
        {   "Authorization":  "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IlhwRUVZUGlZWDVkV1JTeDR4SmpNcEVPc1hTSSIsInBpLmF0bSI6ImRlejAifQ.eyJjbGllbnRfaWQiOiIzZjIwODU4NS0zZGE2LTRiZjctOTRjYS00ZjMxMGQwOTYzYjUiLCJpc3MiOiJodHRwczovL3Nzby5jb21tb24uY2xvdWQuaHBlLmNvbSIsImF1ZCI6ImV4dGVybmFsX2FwaSIsInN1YiI6ImNocmlzLmxpb25ldHRpQGhwZS5jb20iLCJ1c2VyX2N0eCI6IjAwNTZiNzFlZWZjNDExZWJhMjY4NjJhZGI4NzdjMmQ4IiwiYXV0aF9zb3VyY2UiOiJjY3NfdG9rZW5fbWFuYWdlbWVudCIsInBsYXRmb3JtX2N1c3RvbWVyX2lkIjoiOGZmYzRiN2VlOWQyMTFlYjhjZWU2ZTEzYzA3MWVhMzciLCJpYXQiOjE2MzYwNjY4NzksImFwcGxpY2F0aW9uX2luc3RhbmNlX2lkIjoiM2MxOGJkMDMtODMwNi00YzdjLTk0MmUtYzcwNGE0Yjg3NDRjIiwiZXhwIjoxNjM2MDc0MDc5fQ.D38GnVgiQVgNl6TboQC8UOOq0CxlRPo6oEdiq7KnNAojZfrIZJ2bHkAqcqaua4aEB6Y5d2q-DCVf6DQjsKec2utfLHYv-cOEWzzx06dUk4B11fJaCsRWuLNT-NZjSqugUKpp22VBbFn5stUAs3_YXVIlR9x3UqYk9MGZW2QgQtqKjheD6msFiplgzx5g9RPqyViX24V0gNcIXVcRd36wb-Rr_wGP9X6ycy6fXhWtqkKc7c8aKcfwflKsgvcI7p4NIS2LGswuuTrTAspoNgAp-Io0ytsepnxZ6vEiJrxZHhLcL4zEBP-IV9ElsgS3ymMVfhT-uBZXdr1CfV9EHQ0Vgw"
        }
    The Body of this call will be:
        {   "locateEnabled":  true
        }
.LINK
#>   
[CmdletBinding()]
param(  [parameter(mandatory)]  [string]    $StorageSystemId,        
                                [switch]    $WhatIf
     )
process
    {   Invoke-DSCCAutoReconnect
        $MyURI = $BaseURI + 'storage-systems/device-type1/' + $StorageSystemId 
        $MyBody = @{    locateEnabled = $true
                   }
        if ( $WhatIf )
                {   $SysColOnly = invoke-restmethodWhatIf -uri $MyUri -headers $MyHeaders -body $MyBody -method Post
                }   
            else 
                {   $SysColOnly = invoke-restmethod -uri $MyUri -headers $MyHeaders -body $MyBody -method Post
                }
        return $SysColOnly
    }       
}   