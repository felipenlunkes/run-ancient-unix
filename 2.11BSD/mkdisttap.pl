#!/usr/local/bin/perl -w
use strict;

# Based on the example in the HOWTO using dd.  Does not work!
# add_file("cat mtboot mtboot boot |", 512);

# Based on the maketape.c program and the maketape.data data file.
add_file("distro/mtboot", 512);
add_file("distro/mtboot", 512);
add_file("distro/boot", 512);
end_file();

add_file("distro/disklabel", 1024);
end_file();
add_file("distro/mkfs", 1024);
end_file();
add_file("distro/restor", 1024);
end_file();
add_file("distro/icheck", 1024);
end_file();

add_file("distro/root.dump", 10240);
end_file();
add_file("distro/file6.tar", 10240);
end_file();
add_file("distro/file7.tar", 10240);
end_file();
add_file("distro/file8.tar", 10240);
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

