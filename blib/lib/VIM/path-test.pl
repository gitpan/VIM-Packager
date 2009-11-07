
use File::Spec;
use File::Path;
my $path = 'vim/test/test2/orz/vim.vim';
my ($v,$dir,$file) = File::Spec->splitpath( $path );
print $dir;
File::Path::mkpath [ $dir ];
