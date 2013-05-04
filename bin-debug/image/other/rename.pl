#!/usr/bin/perl

@files = `ls *-01.gif`;
foreach $file (@files) {
   chomp($file);
   $new = $file;
   $new =~ s/-01//;
   `mv $file $new`;
}
