$ary_File_location = "H:\Bureaublad\ZA verwerkt met fouten 28-09"
$ary_File = get-content "H:\Bureaublad\ZA verwerkt met fouten 28-09\Bestanden verwerkt met fouten.txt"
$archief_locatie = get-childitem "H:\Bureaublad\ZA verwerkt met fouten 28-09\bestanden uit archief"

foreach ($File_archief in $archief_locatie)
 {
 #write $File_archief.Name.Substring(0,12)
  foreach ($file in $ary_File)
   {
   if ($file -eq $File_archief.Name.Substring(0,12))
   {
   $source = "H:\Bureaublad\ZA verwerkt met fouten 28-09\bestanden uit archief\$File_archief"
   $target = "$ary_File_location\$file"
   copy-item $source $target
   }
   }
 }
