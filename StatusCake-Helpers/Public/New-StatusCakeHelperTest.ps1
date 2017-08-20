
<#
.Synopsis
   Create a StatusCake test check
.EXAMPLE
   New-StatusCakeHelperTest -Username "Username" -ApiKey "APIKEY" -TestName "Example" -TestURL "http://www.example.com" 
.INPUTS
    baseTestURL - Base URL endpoint of the statuscake test API
    Username - Username associated with the API key
    ApiKey - APIKey to access the StatusCake API
    TestName - Name of the Test to be displayed in StatusCake
    TestURL - Test location, either an IP (for TCP and Ping) or a fully qualified URL for other TestTypes
    CheckRate - The interval in seconds between checks
    TestType - The type of test to create

 <optional parameters>
    Port - The port to use on a TCP test
    NodeLocations - Test locations to use separated by commas. Test location GUIDs are required
    Paused - The state of the test should be after it is created. 0 for unpaused, 1 for paused
    Timeout - Time in seconds before a test times out
    PingURL - A URL to ping if a site goes down
    CustomHeader - Custom HTTP header for the test, must be supplied as JSON
    Confirmation - Number of confirmation servers to use must be between 0 and 10
    DNSServer - DNS Tests only. Hostname or IP of DNS server to use.
    DNSIP - DNS Tests only. IP to compare against WebsiteURL value.
    BasicUser - A Basic Auth User account to use to login for a HTTP check
    BasicPass - If BasicUser is set then this should be the password for the BasicUser for a HTTP check
    Public - Set 1 to enable public reporting, 0 to disable
    LogoImage - A URL to a image to use for public reporting
    UseJar - Set to 1 to enable the Cookie Jar. Required for some redirects.
    Branding - Set to 0 to use branding (default) or 1 to disable public reporting branding)
    WebsiteHost - Used internally by StatusCake. Company which hosts the site being tested.
    Virus - Enable virus checking or not. 0 to disable and 1 to enable
    FindString - A string that should either be found or not found.
    DoNotFind - If the above string should be found to trigger a alert. 1 = will trigger if FindString found
    ContactGroup - A contact group ID assoicated with account to use.
    RealBrowser - Use 1 to TURN OFF real browser testing
    TriggerRate - How many minutes to wait before sending an alert
    TestTags - Tags should be seperated by a comma - no spacing between tags (this,is,a set,of,tags)
    StatusCodes - Comma Seperated List of StatusCodes to Trigger Error on (on Update will replace, so send full list each time)
    EnableSSLWarning - HTTP Tests only. If enabled, tests will send warnings if the SSL certificate is about to expire. Paid users only
    FollowRedirect - HTTP Tests only. If enabled, our tests will follow redirects and logo the status of the final page.
.FUNCTIONALITY
   Creates a new StatusCake Test using the supplied parameters. Only parameters which have been supplied values are set
   and the defaults for a particular test type are used otherwise.
#>
function New-StatusCakeHelperTest
{
    [CmdletBinding(PositionalBinding=$false,SupportsShouldProcess=$true)]    
    Param(
        $baseTestURL = "https://app.statuscake.com/API/Tests/Update",
        [Parameter(Mandatory=$true)]        
        $Username,
        [Parameter(Mandatory=$true)]        
        $ApiKey,
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()] 
        $TestName,
        [Parameter(Mandatory=$true)]
        [ValidateScript({If ($_ -match '^((http|https):\/\/)?([a-zA-Z0-9]+(\.[a-zA-Z]+)+.*)$|^(?!^.*,$)((([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))*$') {$true}})]        
        $TestURL,
        [ValidateScript({If ($_ -gt 0 -and $_ -lt 24000) {$true}})]        
        $CheckRate=300,
        [Parameter(Mandatory=$true)]        
        [ValidateSet("HTTP","TCP","PING")] 
        [String]$TestType="HTTP",
        
        #Optional parameters
        [ValidateScript({If ($_ -match '^\d{1,}$') {$true}})]          
        $ContactGroup,
        [object]$TestTags,
        [ValidateScript({If ($_ -match '^\d{1,}$') {$true}})]               
        $Port,
        [object]$NodeLocations,
        [ValidateScript({If ($_ -match '^[0-1]{1}$') {$true}})]
        $Paused,
        [ValidateScript({If ($_ -gt 5 -and $_ -lt 100) {$true}})]  
        $Timeout,
        [ValidateScript({If ($_ -match '^((http|https):\/\/)?([a-zA-Z0-9]+(\.[a-zA-Z]+)+.*)$|^(?!^.*,$)') {$true}})]         
        $PingURL,
        [hashtable]$CustomHeader,
        [ValidateScript({If ($_ -ge 0 -and $_ -le 10) {$true}})]          
        $Confirmation,
        [ValidateScript({If ($_ -match '^([a-zA-Z0-9]{2,}\.[a-zA-Z]{2,})(\.[a-zA-Z]{2,})?|^(?!^.*,$)((([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))*$') {$true}})]         
        [string]$DNSServer,
        [ValidateScript({If ($_ -match '^(?!^.*,$)((([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))*$') {$true}})]           
        [string]$DNSIP,
        [string]$BasicUser,
        [string]$BasePass,
        [ValidateScript({If ($_ -match '^[0-1]{1}$') {$true}})]        
        $Public,
        [ValidateScript({If ($_ -match '^((http|https):\/\/)?([a-zA-Z0-9]+(\.[a-zA-Z]+)+.*)$|^(?!^.*,$)') {$true}})]        
        $LogoImage,
        [ValidateScript({If ($_ -match '^[0-1]{1}$') {$true}})]        
        $UseJar,
        [ValidateScript({If ($_ -match '^[0-1]{1}$') {$true}})]        
        $Branding,
        [string]$WebsiteHost,
        [ValidateScript({If ($_ -match '^[0-1]{1}$') {$true}})]        
        $Virus,
        [string]$FindString,
        [ValidateScript({If ($_ -match '^[0-1]{1}$') {$true}})]        
        $DoNotFind,
        [ValidateScript({If ($_ -match '^[0-1]{1}$') {$true}})]        
        $RealBrowser,
        [ValidateScript({If ($_ -ge 0 -and $_ -le 60) {$true}})]           
        $TriggerRate,     
        [object]$StatusCodes,
        [ValidateScript({If ($_ -match '^[0-1]{1}$') {$true}})]        
        $EnableSSLWarning,
        [ValidateScript({If ($_ -match '^[0-1]{1}$') {$true}})]        
        $FollowRedirect
    )
    $authenticationHeader = @{"Username"="$username";"API"="$ApiKey"}

    $testCheck = Get-StatusCakeHelperTest -Username $username -apikey $ApiKey -TestName $TestName
    if($testCheck)
    {
        $result = [PSCustomObject]@{"Success" = "False";"Message" = "Test with specified name already exists";"Data" = $testCheck;"InsertID" = -1}
        Return $result
    }

    $body = @{}

    $ParameterList = (Get-Command -Name $MyInvocation.InvocationName).Parameters
    $ParamsToIgnore = @("baseTestURL","Username","ApiKey")
    foreach ($key in $ParameterList.keys)
    {
        $var = Get-Variable -Name $key -ErrorAction SilentlyContinue;
        if($ParamsToIgnore -contains $var.Name)
        {
            continue
        }
        elseif($var.value -or $var.value -eq 0)
        {
            write-verbose "$($var.name) will be added to StatusCake Test with value $($var.value)"
            switch($var.name)
            {
                "TestName"{$body.Add("WebsiteName",$TestName)}
                "TestURL"{$body.Add("WebsiteURL",$TestURL)}
                "TestTags"{  #Test Tags need to be supplied as a comma separated list
                    $TestTags = $TestTags -join ","
                    $body.Add($var.name,$var.value)
                }
                "NodeLocations"{ #Node Location IDs need to be supplied as a comma separated list
                    $NodeLocations = $NodeLocations -join ","
                    $body.Add($var.name,$var.value)                                        
                }
                "StatusCodes"{ #Status Codes need to be supplied as a comma separated list
                    $StatusCodes = $StatusCodes -join ","
                    $body.Add($var.name,$var.value)                                        
                }
                "CustomHeader"{ #Custom Header must be supplied as JSON
                    $CustomHeader = $CustomHeader | ConvertTo-Json
                    $body.Add($var.name,$var.value)                       
                }
                default {$body.Add($var.name,$var.value)}
            }
        }
    }

    $putRequestParams = @{
        uri = $baseTestURL
        Headers = $authenticationHeader
        UseBasicParsing = $true
        method = "Put"
        ContentType = "application/x-www-form-urlencoded"
        body = $body 
    }

    if( $pscmdlet.ShouldProcess("TestName - $TestName, TestURL - $TestURL", "Add StatusCake Test") )
    {
        $jsonResponse = Invoke-WebRequest @putRequestParams
        $response = $jsonResponse | ConvertFrom-Json
        Return $response
    }

}