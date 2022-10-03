#!/bin/env perl
# Makes tree annotation file for iTOL for 
# https://github.com/ncbi/workshop-asm-ngs-2022/wiki/Project-2
# 
# Run like:
# perl make_tree_colors.pl > tree_colors.txt
use strict;
use warnings;
no warnings 'qw';

my %colors = qw(
289         #E41A1C
291         #984EA3
292         #F781BF
293         #377EB8
294         #FF7F00
295         #A65628
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
