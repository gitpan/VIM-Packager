
my %install = ();
my $base_prefix = 'viml';
my $prefix = File::Spec->join($ENV{HOME} , '.vim');
use File::Find;
File::Find::find( sub {
    return unless -f $_;
    return if /\#/;
    return if /~$/;             # emacs temp files
    return if /,v$/;            # RCS files
    return if m{\.swp$};        # vim swap files

    my $src = File::Spec->catfile( $File::Find::dir , $_ );

    my $target;
    ( $target = $src ) =~ s{^$base_prefix/}{};
    $target = File::Spec->catfile( $prefix , $target );

    $install{ $src } = $target;
} , $base_prefix );
use Data::Dumper;warn Dumper( \%install );
