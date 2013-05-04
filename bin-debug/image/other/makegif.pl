$count = 0;
$names = "";
@files = `dir /b /s *.gif`;
foreach $file (@files) {
   chomp ($file);
   $names .= " \"$file\"";

   $count++;
   if ($count >= 300) {
      `makegif.exe $names`;
      $count = 0;
      $names = "";
   }
}

`makegif.exe $names`;