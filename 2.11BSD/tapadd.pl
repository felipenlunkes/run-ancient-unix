#!/usr/local/bin/perl -w
use strict;

if(@ARGV != 1) {
  print STDERR "Usage: $0 <filename>\n";
  exit(1);
}

add_file($ARGV[0], 512);
end_file();
end_file();

sub end_file {
  print "\x00\x00\x00\x00";
}

sub add_file {
  my($filename, $blocksize) = @_;
  my($block, $bytes_read, $length);

  open(FILE, $filename) || die("Can't open $filename: $!");
  while($bytes_read = read(FILE, $block, $blocksize)) {
    if($bytes_read < $blocksize) {
      $block .= "\x00" x ($blocksize - $bytes_read);
      $bytes_read = $blocksize;
    }
    $length = pack("V", $bytes_read);
    print $length, $block, $length;
  }
  close(FILE);
}

