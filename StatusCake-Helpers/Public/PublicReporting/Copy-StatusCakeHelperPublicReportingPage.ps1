
<#
.SYNOPSIS
    Copies the settings of a StatusCake Public Reporting Page
.DESCRIPTION
    Creates a copy of a Public Reporting Page.
.PARAMETER APICredential
    Credentials to access StatusCake API
.PARAMETER ID
    ID of the Public Reporting Page to be copied
.PARAMETER Title
    Name of the Public Reporting Page to be copied
.PARAMETER NewTitle
    Name of the new Public Reporting Page
.EXAMPLE
    C:\PS>Copy-StatusCakeHelperPublicReportingPage -Name "Example" -NewTitle "Example - Copy"
    Creates a copy of a public reporting page called "Example" with name "Example - Copy"
.EXAMPLE
    C:\PS>Copy-StatusCakeHelperPublicReportingPage -ID a1B2c3D4e5 -NewTitle "Example - Copy"
    Creates a copy of a public reporting page with ID a1B2c3D4e5 with name "Example - Copy"
#>
function Copy-StatusCakeHelperPublicReportingPage
{
    [CmdletBinding(PositionalBinding=$false,SupportsShouldProcess=$true)]
    Param(
        [Parameter(ParameterSetName='CopyByTitle')]
        [Parameter(ParameterSetName='CopyById')]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential] $APICredential = (Get-StatusCakeHelperAPIAuth),

        [Parameter(ParameterSetName='CopyById',Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Id,

        [Parameter(ParameterSetName='CopyByTitle',Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Title,

        [Parameter(ParameterSetName='CopyByTitle',Mandatory=$true)]
        [Parameter(ParameterSetName='CopyById',Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$NewTitle
    )

    if($Name)
    {   #If copying by name check if resource with that name exists
        if( $pscmdlet.ShouldProcess("StatusCake API", "Retrieve StatusCake Public Reporting Pages"))
        {
            $statusCakeItem = Get-StatusCakeHelperPublicReportingPage -APICredential $APICredential -Title $Title
            if(!$statusCakeItem)
            {
                Write-Error "No Public Reporting Page with Specified Title Exists [$Title]"
                Return $null
            }
            elseif($statusCakeItem.GetType().Name -eq 'Object[]')
            {
                Write-Error "Multiple Public Reporting Pages with the same title [$Title] [$($statusCakeItem.ID)]"
                Return $null
            }
        }
    }
    elseif($ID)
    {   #If copying by ID verify that a resource with the Id already exists
        if( $pscmdlet.ShouldProcess("StatusCake API", "Retrieve StatusCake Public Reporting Pages"))
        {
            $statusCakeItem = Get-StatusCakeHelperPublicReportingPage -APICredential $APICredential -id $ID
            if(!$statusCakeItem)
            {
                Write-Error "No Public Reporting Page with Specified ID Exists [$ID]"
                Return $null
            }
        }
    }

    if( $pscmdlet.ShouldProcess("StatusCake API", "Retrieve Detailed StatusCake Public Reporting Page Data"))
    {
        $statusCakeItem = Get-StatusCakeHelperPublicReportingPageDetail -APICredential $APICredential -Id $statusCakeItem.Id
    }

    $psParams = $statusCakeItem | Get-StatusCakeHelperCopyParameter -FunctionName "New-StatusCakeHelperPublicReportingPage"
    $psParams.Title = $NewTitle

    if(!([string]::IsNullOrEmpty($statusCakeItem.tests_or_tags)))
    {
        #Work out whether tests_or_tags property contain test IDs or tags
        if($statusCakeItem.use_tags -eq "true")
        {
            $tags = $statusCakeItem.tests_or_tags -split ","
            $psParams.Add("TestTags",$tags)
        }
        else
        {
            $testIDs = [int[]]$statusCakeItem.tests_or_tags -split ","
            $psParams.Add("TestIDs",$testIDs)
            #Tags_inclusive will always be returned with a value and function only requires this value if tags are used to setup public reporting page
            $psParams.Remove("tags_inclusive")
        }
    }

    if( $pscmdlet.ShouldProcess("StatusCake API", "Create StatusCake Public Reporting Page"))
    {
        $result = New-StatusCakeHelperPublicReportingPage -APICredential $APICredential @psParams
    }
    Return $result
}