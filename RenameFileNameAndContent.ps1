$strSample_Path = "C:\Users\Thirsa\Desktop\ps1";
cd $strSample_Path
$aryfSample = Get-childItem -path $strSample_Path;

Function Rename($fFile_From)
 {
  $arystrFile_From_Line = Get-Content -Path $fFile_From.FullName;


  $arystrFile_From_Line[0] = "$($arystrFile_From_Line[0].Substring(0,18))$($intFile_Extention_Character_First)$($arystrFile_From_Line[0].Substring(19))";
  
  foreach ($strFile_From_Line in $arystrFile_From_Line)
   {
    Write-Output $strFile_From_Line | Out-File -Append -LiteralPath "$($fFile_From.BaseName).$intFile_Extention_Character_First$($fFile_From.Extension.Substring(2))";
   }
  
     
  #Rename-Item -Path $fFile_From.FullName -NewName "$($fFile_From.BaseName).$intFile_Extention_Character_First$($fFile_From.Extension.Substring(2))";
  write "$($fFile_From.BaseName).$intFile_Extention_Character_First$($fFile_From.Extension.Substring(2))" 
 }

foreach ($fSample in $aryfSample) 
 {
  #write $fSample.Name.Length;
  if ($fSample.Name.Length -eq 11)
   {
    $intFile_Extention_Character_First = $fSample.Extension.Substring(1,1);
    write $intFile_Extention_Character_First
    switch ($intFile_Extention_Character_First)
     {
      0
       {
        $intFile_Extention_Character_First = 9;
        Rename($fSample, $intFile_Extention_Character_First);
       }
      8 
       {
        $intFile_Extention_Character_First = 7;
        Rename($fSample, $intFile_Extention_Character_First);
       }
      9 
       {
        $intFile_Extention_Character_First = 8;
        Rename($fSample, $intFile_Extention_Character_First);
       }
     }
   }
 }