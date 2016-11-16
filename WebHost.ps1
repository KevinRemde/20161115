Configuration WebHost
{
    param 
    (
        [Parameter(Mandatory)]
        [String]$MachineName
    ) 

    Node $MachineName
    {
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
    }
}
