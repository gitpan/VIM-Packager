use warnings;
use strict;


use DateTime::Format::DateParse;
my $version_output = qx{vim --version};
print $version_output;
my @lines = split /\n/,$version_output;

my ($version,$date_string) = $lines[0] =~ /^VIM - Vi IMproved ([0-9.]+) \((.*?)\)/;
my ($revision_date,$compiled_time) = split /,/,$date_string;
$compiled_time =~ s/\s*compiled\s*//;
# $revision_date = DateTime::Format::DateParse->parse_datetime( $revision_date );
$compiled_time = DateTime::Format::DateParse->parse_datetime( $compiled_time );


my ($platform) = $lines[1] =~ /^(.*?) version/;


# Included patches: 1-264
my ($patch_from,$patch_to) = $lines[2] =~ /^Included patches: (\d+)-(\d+)$/;

# Compiled by c9s@Oulixeus.local
my ($compiled_by) = $lines[3] =~ /^Compiled by (.*?)$/;


my $vim_info = {
    version => $version,
    platform => $platform,
    compiled_on => $compiled_time ,
    patch_from => $patch_from,
    patch_to  => $patch_to,
    compiled_by => $compiled_by
};
use Data::Dumper;warn Dumper( $vim_info );
