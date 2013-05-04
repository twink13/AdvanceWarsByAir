#!/usr/bin/perl

@files = `ls jadesun*.gif`;
foreach $file (@files) {
   chomp $file;
   ($name, $ext) = split(/\./, $file);
#   `convert $file $name.gif`;

   $first = substr($file, 0, 3);
#   if ($first ne "gs_" && $ext eq "gif") {
      `convert $file -fill "#000000" -colorize 30/30/30 gs_${name}.gif`;
      # `convert $file -fill "#CCCCCC" -colorize 60/60/60 white_$file`;
#   }
# convert blackholebase.gif +repage -crop 16x25+0+2 +repage
}
