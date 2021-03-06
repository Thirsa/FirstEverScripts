cd H:
$strF_path = "H:\Bureaublad\Dinz test";
$aryF_File = Get-ChildItem $strF_path

function rename
  {
  $strNew_file_name = $strF_Basename + "." + $strF_sub_extention + $strF_sub_extention2
  $strNew_file_first_line = $strF_first_line + $strF_first_line_sub + $strF_first_line_rest 
  $int_line_count = $strF_content.count -1
  write-output $strNew_file_first_line $strF_content[1..$int_line_count] | out-file -FilePath ("H:\Bureaublad\Dinz test\Hernoemd\" + $strNew_file_name) 
  }

foreach ($strf_file in $aryF_File)
  {
   if ($strf_file.name.Length -eq 12) 
   {
    $strF_content = Get-content -path $strf_file.fullname 
    $strF_sub_extention = $strf_file.Extension.Substring(1,1)
    $strF_first_line_sub = $strF_content[0].substring(12,1)
    $strF_Basename = $strf_file.basename
    $strF_sub_extention2 = $strf_file.Extension.Substring(2,2)
    $strF_first_line = $strF_content[0].substring(0,12)
    $strF_first_line_rest = $strF_content[0].substring(13)
      
     switch ($strF_sub_extention)
     {
       0 
        {
         $strF_sub_extention = 9
         $strF_first_line_sub = 9
         rename
        }
       9
        {
         $strF_sub_extention = 8
         $strF_first_line_sub = 8
         rename             
        }
       8
        {
         $strF_sub_extention = 7
         $strF_first_line_sub = 7
         rename  
        }
     } 
   }
  }

