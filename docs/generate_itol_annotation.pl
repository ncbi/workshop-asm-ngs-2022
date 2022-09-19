#!/bin/env perl
use strict;
use warnings;
my %colors = qw(
290         #caf390
292         #d70404
293         #548c41
294         #6055b9
295         #a1ff1d
295.667     #d1a77b
296         #f98534
);

print <<END;
# Header
TREE_COLORS
SEPARATOR SPACE
DATA
END

while (<>) {
    chomp;
    my @F = split(/\t/);
    print join("_", @F), " label ", $colors{$F[2]}, " normal 1.2\n";
}
