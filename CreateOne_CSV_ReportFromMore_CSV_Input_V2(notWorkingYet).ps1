Z:
function Select-Folder($message='Select a folder', $path = 'Z:\intf-thinsy-prod\Outputfiles_JCSP\ProcesControl\ZZV\(CRT00060) Rapportage Factuurperioden') { 
    $object = New-Object -comObject Shell.Application  
     
    $folder = $object.BrowseForFolder(0, $message, 0, $path) 
    if ($folder -ne $null) { 
        $folder.self.Path 
    } 
} 
 
Select-Folder  

$strFile_dest = (Get-Item -Path ".\").FullName
$strOutput_Path = 'Z:\intf-thinsy-prod\Outputfiles_JCSP\ProcesControl\ZZV\(CRT00060) Rapportage Factuurperioden\Rapportages 2015\30 periodes.csv'
write $strOutput_Path

Remove-Item $strOutput_Path;

$aryfCSV = Get-ChildItem -Path 'Z:\intf-thinsy-prod\Outputfiles_JCSP\ProcesControl\ZZV\(CRT00060) Rapportage Factuurperioden\Rapportages 2015\Periode 042015\Run 2_14667' -Filter "*.csv";

write ("Facturatieperiode ?? 'jaartal' Run ??","Batchnummer?","Aantal Periodes") | Out-File -Encoding default -Append $strOutput_Path;

foreach ($fCSV in $aryfCSV)
 {
  $arystrCSV_Line = Get-Content -Path $fCSV.FullName;
  $arystrCSV_Name = $fCSV.Name.Split("_");

  if ($arystrCSV_Name[2] -ge '30' -and $arystrCSV_Name[2].length -eq 2)
   {
    $intCSV_Line_Index = 0;
    
    foreach ($strCSV_Line in $arystrCSV_Line)
     { 
      $intCSV_Line_Index += 1
      
      switch ($intCSV_Line_Index)
       {
        1 {}
        2 {}
        3 {}

        4
         {
          write  "$($arystrCSV_Name[2]);$strCSV_Line" | Out-File -Encoding default -Append $strOutput_Path;
         }

        default
         {
          write ";$strCSV_Line" | Out-File -Encoding default -Append $strOutput_Path;
         }
       }
     }
   }
 }