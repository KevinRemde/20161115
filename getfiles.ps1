Configuration getfiles
{

  param 
  (
    [Parameter(Mandatory)]
    [String]$MachineName,
    
    [Parameter(Mandatory)]
    [String]$FileURI
  ) 

  Node $MachineName
  {
	  Script ConfigureVM 
    { 
	  	SetScript = 
        { 
	        $dir = "c:\Files"
#         $FileURI = "https://raw.githubusercontent.com/KevinRemde/AZInfraLabBase/master/labfiles.zip"
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