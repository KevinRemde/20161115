    param 
    (
        [Parameter(Mandatory)]
        [String]$MachineName,
    
        [Parameter(Mandatory)]
        [String]$FileURI
    ) 
    Configuration WebHost
{
    Node $MachineName
    {
 <#
        # Install the IIS role 
        WindowsFeature IIS 
        { 
            Ensure          = "Present" 
            Name            = "Web-Server" 
        } 
        # Install the ASP .NET 4.5 role 
        WindowsFeature AspNet45 
        { 
            Ensure          = "Present" 
            Name            = "Web-Asp-Net45" 
        } 

        WindowsFeature WebStaticContent
        { 
            Ensure          = "Present" 
            Name            = "Web-Static-Content" 
        } 

        WindowsFeature WebStatCompression
        { 
            Ensure          = "Present" 
            Name            = "Web-Stat-Compression"
        } 

        WindowsFeature WebDynCompression
        { 
            Ensure          = "Present" 
            Name            = "Web-Dyn-Compression"
        } 

        WindowsFeature WebMgmtConsole
        { 
            Ensure          = "Present" 
            Name            = "Web-Mgmt-Console"
        }

        WindowsFeature FileServer 
	    {
            Ensure          = "Present"
            Name            = "FS-FileServer"
        }
	    WindowsFeature MessageQueueFeature
	    {
	        Ensure          = "Present"
	        Name            = "MSMQ"
	    }		
	    WindowsFeature MessageQueueTriggers
	    {
	        Ensure          = "Present"
	        Name            = "MSMQ-Triggers"
	    }
#>		
        Script ConfigureVM 
        { 
	  	    SetScript = 
            { 
	            $dir = "c:\Files"
#                $FileURI = "https://raw.githubusercontent.com/KevinRemde/20161115/master/files.zip"
                New-Item $dir -ItemType directory
                $output = "$dir\Files.zip"
                (New-Object System.Net.WebClient).DownloadFile($FileURI,$output)
            } 
		    TestScript = 
            { 
			    Test-Path c:\Files
		    } 
		    GetScript = { <# This must return a hash table #> }          
	    }   
    }
}
