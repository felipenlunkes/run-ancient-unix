#!/usr/local/bin/perl -w

use strict;
use vars qw($filename $filenum);

if(@ARGV != 2) {
  printf STDERR "Usage: $0 <tape file> <file number>\n";
  exit(1);
}

$filename = $ARGV[0];
$filenum  = $ARGV[1];

open(INPUT, $filename) || die("Can't open $filename: $!");

while($filenum--) {
  readfile(0);
}

readfile(1);
exit(0);

sub readfile {
  my($print) = @_;
  my($block);

  while(defined($block = readblock())) {
    if($print) {
      print $block;
    }
  }
}

sub readblock {
  my($blocksize, $bs2, $block);

  read(INPUT, $blocksize, 4);
  $blocksize = unpack("V", $blocksize);
  return undef unless $blocksize;

  read(INPUT, $block, $blocksize);
  read(INPUT, $bs2, 4);
  $bs2 = unpack("V", $bs2);
  $blocksize == $bs2 || die("Invalid tape format");
  return $block;
}
