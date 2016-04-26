# Armadito Perl patch script 

sub EscapeStringForRegex {
	my $str = shift;

	$str =~ s/\\/\\\\/msig;
	$str =~ s/\//\\\//msig;
	$str =~ s/\./\\\./msig;
	$str =~ s/\^/\\\^/msig;
	$str =~ s/\|/\\\|/msig;
	$str =~ s/\{/\\\{/msig;
	$str =~ s/\}/\\\}/msig;
	$str =~ s/\[/\\\[/msig;
	$str =~ s/\]/\\\]/msig;
	$str =~ s/\(/\\\(/msig;
	$str =~ s/\)/\\\)/msig;
	$str =~ s/\$/\\\$/msig;
	$str =~ s/\+/\\\+/msig;
	$str =~ s/\?/\\\?/msig;
	$str =~ s/\@/\\\@/msig;
	$str =~ s/\*/\\\*/msig;
	$str =~ s/\!/\\\!/msig;

	return $str;
}


my $win32path = "clamav-devel\\win32";

my @vcxprojs = ("libclamav", "libclamavcxx", 
				"libclamunrar", "libclamunrar_iface", 
				"LLVMcodegen", "LLVMjit", 
				"LLVMsystem", "LLVMx86codegen" );

die "$win32path does not exists. Please, download clamav sources first." unless( -d $win32path );
				
my $inc_path_to_replace = 'C:\clamdeps\win32\openssl\include';
my $new_inc_path = '$(SolutionDir)..\..\..\openssl\out\include\32bit';
$inc_path_to_replace = &EscapeStringForRegex($inc_path_to_replace);

my $lib_path_to_replace = 'C:\clamdeps\win32\openssl\lib';
my $new_lib_path = '$(SolutionDir)..\..\..\openssl\out\lib\32bit';
$lib_path_to_replace = &EscapeStringForRegex($lib_path_to_replace);
				
foreach(@vcxprojs){
	open (FR, "<", $win32path."\\".$_.".vcxproj") or die $!;
    my $file = do { local $/; <FR> };
	close(FR);
	
	# We patch vcxprojs here
	$file =~ s/$inc_path_to_replace/$new_inc_path/msg;
	$file =~ s/$lib_path_to_replace/$new_lib_path/msg;
	
	open (FW, ">", $win32path."\\".$_.".vcxproj") or die $!;
	print FW $file;
	close(FW);
}

# If something went wrong, just undo changes (i.e. git reset in clamav-devel/win32 folder)
				
