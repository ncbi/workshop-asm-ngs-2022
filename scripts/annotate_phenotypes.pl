#!/bin/env perl
# Makes an iTOL phenotype annotation file for
# https://github.com/ncbi/workshop-asm-ngs-2022/wiki/Project-2
#
# Run like:
# perl annotate_phenotypes.pl ReferenceGeneCatalog.txt > phenotype_annotation.txt
use strict;
use warnings;
print <<END;
DATASET_BINARY
SEPARATOR SPACE
DATASET_LABEL phenotype
FIELD_SHAPES 1 2 3
FIELD_COLORS #ff0000 #0000ff #000000
FIELD_LABELS inhibitor_resistant cephalosporin carbapenem
LEGEND_TITLE Phenotype
LEGEND_POSITION_X 70
LEGEND_POSITION_Y 70
LEGEND_HORIZONTAL 1
LEGEND_SHAPES 1 2 3
LEGEND_COLORS #ff0000 #0000ff #000000
LEGEND_LABELS inhibitor_resistant cephalosporin carbapenem
LEGEND_SHAPE_SCALES 1 1 1
ALIGN_TO_LABELS 1
DATA
END

while (<>) {
    chomp;
    my @F = split /\t/;
    next unless (/blaKPC/ && ($F[16]-$F[15]+1)/3 < 297);
    my $label = "$F[10]_$F[0]_" . (($F[19] - $F[18] + 1) / 3 - 1);
    my @values = (0, 0, 0);
    $values[0] = $F[3] =~ /inhibitor-resistant/ ? 1 : 0;
    $values[1] = $F[8] =~ /CEPHALOSPORIN/ ? 1 : 0;
    $values[2] = $F[8] =~ /CARBAPENEM/ ? 1 : 0;
    print join(" ", $label, @values), "\n";
}

