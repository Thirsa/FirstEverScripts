
$strOutput_Path = 'Z:\intf-thinsy-prod\Outputfiles_JCSP\ProcesControl\ZZV\(CRT00060) Rapportage Factuurperioden\30 periodes.csv'

Remove-Item $strOutput_Path;

$aryfCSV = Get-ChildItem -Path 'Z:\intf-thinsy-prod\Outputfiles_JCSP\ProcesControl\ZZV\(CRT00060) Rapportage Factuurperioden\Rapportages 2015\Periode 062015\Run 2 - 14919' -Filter "*.csv";

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