# Set-StatusCakeHelperTest

## SYNOPSIS
Set the configuration of a StatusCake test

## SYNTAX

### SetNewTest
```
Set-StatusCakeHelperTest [-APICredential <PSCredential>] -TestName <String> -TestURL <String>
 -CheckRate <Int32> -TestType <String> [-BasicPass <SecureString>] [-BasicUser <String>] [-Branding <Boolean>]
 [-Confirmation <Int32>] [-ContactGroup <Int32[]>] [-CustomHeader <Hashtable>] [-DNSIP <String>]
 [-DNSServer <String>] [-DoNotFind <Boolean>] [-EnableSSLWarning <Boolean>] [-FinalEndpoint <String>]
 [-FindString <String>] [-FollowRedirect <Boolean>] [-LogoImage <String>] [-NodeLocations <String[]>]
 [-Paused <Boolean>] [-PingURL <String>] [-Port <Int32>] [-PostRaw <String>] [-Public <Boolean>]
 [-RealBrowser <Boolean>] [-StatusCodes <String[]>] [-Tags <String[]>] [-Timeout <Int32>]
 [-TriggerRate <Int32>] [-UseJar <Boolean>] [-UserAgent <String>] [-Virus <Boolean>] [-WebsiteHost <String>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### SetByTestID
```
Set-StatusCakeHelperTest [-APICredential <PSCredential>] -TestID <Int32> [-TestName <String>]
 [-TestURL <String>] [-CheckRate <Int32>] [-TestType <String>] [-BasicPass <SecureString>]
 [-BasicUser <String>] [-Branding <Boolean>] [-Confirmation <Int32>] [-ContactGroup <Int32[]>]
 [-CustomHeader <Hashtable>] [-DNSIP <String>] [-DNSServer <String>] [-DoNotFind <Boolean>]
 [-EnableSSLWarning <Boolean>] [-FinalEndpoint <String>] [-FindString <String>] [-FollowRedirect <Boolean>]
 [-LogoImage <String>] [-NodeLocations <String[]>] [-Paused <Boolean>] [-PingURL <String>] [-Port <Int32>]
 [-PostRaw <String>] [-Public <Boolean>] [-RealBrowser <Boolean>] [-StatusCodes <String[]>] [-Tags <String[]>]
 [-Timeout <Int32>] [-TriggerRate <Int32>] [-UseJar <Boolean>] [-UserAgent <String>] [-Virus <Boolean>]
 [-WebsiteHost <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### SetByTestName
```
Set-StatusCakeHelperTest [-APICredential <PSCredential>] [-SetByTestName] -TestName <String>
 [-TestURL <String>] [-CheckRate <Int32>] [-TestType <String>] [-BasicPass <SecureString>]
 [-BasicUser <String>] [-Branding <Boolean>] [-Confirmation <Int32>] [-ContactGroup <Int32[]>]
 [-CustomHeader <Hashtable>] [-DNSIP <String>] [-DNSServer <String>] [-DoNotFind <Boolean>]
 [-EnableSSLWarning <Boolean>] [-FinalEndpoint <String>] [-FindString <String>] [-FollowRedirect <Boolean>]
 [-LogoImage <String>] [-NodeLocations <String[]>] [-Paused <Boolean>] [-PingURL <String>] [-Port <Int32>]
 [-PostRaw <String>] [-Public <Boolean>] [-RealBrowser <Boolean>] [-StatusCodes <String[]>] [-Tags <String[]>]
 [-Timeout <Int32>] [-TriggerRate <Int32>] [-UseJar <Boolean>] [-UserAgent <String>] [-Virus <Boolean>]
 [-WebsiteHost <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the test based on the supplied values.

## EXAMPLES

### EXAMPLE 1
```
Set-StatusCakeHelperTest -TestID "123456" -TestName "http://www.example.com"
```

Change the name of test ID 123456 to "http://www.example.com"

## PARAMETERS

### -APICredential
Credentials to access StatusCake API

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-StatusCakeHelperAPIAuth)
Accept pipeline input: False
Accept wildcard characters: False
```

### -TestID
ID of the Test

```yaml
Type: Int32
Parameter Sets: SetByTestID
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetByTestName
Switch to configure test by name

```yaml
Type: SwitchParameter
Parameter Sets: SetByTestName
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -TestName
Name of the Test to be displayed in StatusCake

```yaml
Type: String
Parameter Sets: SetNewTest, SetByTestName
Aliases: WebsiteName

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: SetByTestID
Aliases: WebsiteName

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TestURL
Test location, either an IP (for TCP and Ping) or a fully qualified URL for other TestTypes

```yaml
Type: String
Parameter Sets: SetNewTest
Aliases: WebsiteURL

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: SetByTestID, SetByTestName
Aliases: WebsiteURL

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CheckRate
The interval in seconds between checks

```yaml
Type: Int32
Parameter Sets: SetNewTest
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: Int32
Parameter Sets: SetByTestID, SetByTestName
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TestType
The type of test to create.
Valid options are "HTTP","TCP","PING","DNS"

```yaml
Type: String
Parameter Sets: SetNewTest
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: SetByTestID, SetByTestName
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BasicPass
If BasicUser is set then this should be the password for the BasicUser for a HTTP check

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BasicUser
A Basic Auth User account to use to login for a HTTP check

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Branding
Set to 0 to use branding (default) or 1 to disable public reporting branding

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirmation
Number of confirmation servers to use must be between 0 and 10

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContactGroup
An array of contact group IDs to be assigned to the check

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomHeader
Custom HTTP header for the test, must be supplied as as hashtable

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DNSIP
DNS Tests only.
IP to compare against WebsiteURL value.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DNSServer
DNS Tests only.
Hostname or IP of DNS server to use.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DoNotFind
If the value for the FindString parameter should be found to trigger a alert.
1 = will trigger if FindString found

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableSSLWarning
HTTP Tests only.
If enabled, tests will send warnings if the SSL certificate is about to expire.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FinalEndpoint
Use to specify the expected Final URL in the testing process

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FindString
A string that should either be found or not found.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FollowRedirect
HTTP Tests only.
If enabled, our tests will follow redirects and logo the status of the final page.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogoImage
A URL to a image to use for public reporting

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NodeLocations
Test locations to use separated by commas.
Test location servercodes are required

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Paused
The state of the test should be after it is created.
0 for unpaused, 1 for paused

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PingURL
A URL to ping if a site goes down

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Port
The port to use on a TCP test

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PostRaw
Use to populate the RAW POST data field on the test

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Public
Set 1 to enable public reporting, 0 to disable

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -RealBrowser
Use 1 to TURN OFF real browser testing

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -StatusCodes
Comma Separated List of StatusCodes to Trigger Error on (on Update will replace, so send full list each time)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
Array of tags to assign to a test

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: TestTags

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timeout
Time in seconds before a test times out

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TriggerRate
How many minutes to wait before sending an alert

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseJar
Set to 1 to enable the Cookie Jar.
Required for some redirects.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserAgent
Use to populate the test with a custom user agent

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Virus
Enable virus checking or not.
0 to disable and 1 to enable

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WebsiteHost
Used internally by StatusCake.
Company which hosts the site being tested.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
