# Armadito Perl patch script 
my $openssl_version = '1.0.1t';

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
				
my $inc32_path_to_replace = 'C:\clamdeps\win32\openssl\include';
$inc32_path_to_replace = &EscapeStringForRegex($inc32_path_to_replace);
#my $new_inc32_path = '$(SolutionDir)..\..\..\openssl\out\include\32bit';
my $new_inc32_path = '$(SolutionDir)..\..\..\openssl\src\openssl-' . $openssl_version . '-32bit-$(Configuration)-DLL-VS2013\include';

my $lib32_path_to_replace = 'C:\clamdeps\win32\openssl\lib';
$lib32_path_to_replace = &EscapeStringForRegex($lib32_path_to_replace);
#my $new_lib_path = '$(SolutionDir)..\..\..\openssl\out\lib\32bit';
my $new_lib32_path = '$(SolutionDir)..\..\..\openssl\src\openssl-' . $openssl_version . '-32bit-$(Configuration)-DLL-VS2013\lib';
				
my $inc64_path_to_replace = 'C:\clamdeps\win64\openssl\include';
$inc64_path_to_replace = &EscapeStringForRegex($inc64_path_to_replace);
#my $new_inc64_path = '$(SolutionDir)..\..\..\openssl\out\include\64bit';
my $new_inc64_path = '$(SolutionDir)..\..\..\openssl\src\openssl-' . $openssl_version . '-64bit-$(Configuration)-DLL-VS2013\include';

my $lib64_path_to_replace = 'C:\clamdeps\win64\openssl\lib';
$lib64_path_to_replace = &EscapeStringForRegex($lib64_path_to_replace);
#my $new_lib_path = '$(SolutionDir)..\..\..\openssl\out\lib\64bit';
my $new_lib64_path = '$(SolutionDir)..\..\..\openssl\src\openssl-' . $openssl_version . '-64bit-$(Configuration)-DLL-VS2013\lib';
				
foreach(@vcxprojs){
	open (FR, "<", $win32path."\\".$_.".vcxproj") or die $!;
    my $file = do { local $/; <FR> };
	close(FR);
	
	# We patch vcxprojs here
	$file =~ s/$inc32_path_to_replace/$new_inc32_path/msg;
	$file =~ s/$lib32_path_to_replace/$new_lib32_path/msg;
	$file =~ s/$inc64_path_to_replace/$new_inc64_path/msg;
	$file =~ s/$lib64_path_to_replace/$new_lib64_path/msg;
	
	open (FW, ">", $win32path."\\".$_.".vcxproj") or die $!;
	print FW $file;
	close(FW);
}

# If something went wrong, just undo changes (i.e. git reset in clamav-devel/win32 folder)
				
