
Configuration WebHost
{
    param 
    ( 
        # Target nodes to apply the configuration 
        [string[]]$NodeName = 'localhost' 
    ) 

    Import-DscResource –ModuleName 'PSDesiredStateConfiguration'

    Node $NodeName
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
    }
}
