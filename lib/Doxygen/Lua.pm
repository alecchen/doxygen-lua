package Doxygen::Lua;

use warnings;
use strict;
use Moose;

=head1 NAME

Doxygen::Lua - Make Doxygen support Lua

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';
has 'mark' => ( is => 'rw', isa => 'Str', default => '--!' );

=head1 SYNOPSIS

    use Doxygen::Lua;
    my $p = Doxygen::Lua->new;
    print $p->parse($input);

=head1 DESCRIPTION

A script named "lua2dox" will be installed. Then modify your Doxyfile as below:

    FILTER_PATTERNS = *.lua=../bin/lua2dox

That's all!

=head1 SUBROUTINES/METHODS

=head2 new

This function will create a Doxygen::Lua object.

=cut

=head2 parse

This function will parse the given input file and return the result.

=cut

sub parse {
    my $self = shift;
    my $input = shift;

    my $in_block = 0;
    my $block_name = q{};
    my $result = q{};

    my $mark = $self->mark;
     
    open FH, "<$input"
        or die "Can't open $input for reading: $!";
     
    foreach my $line (<FH>) {
        chomp($line);

        # comments
        next if $line =~ /^\s*--[^!]/;
        $line =~ s/--[^!].*//;
        $line =~ s{$mark}{///};

        if ($line =~ /==/) {
            next;
        }
        # function
        elsif ($line =~ /function/) {
            $line .= q{;};
        }
        # block start
        elsif ($line =~ /^(\S+)\s*=\s*{/ && $line !~ /}/) {
            $block_name = $1; $in_block = 1;
            next;
        }
        elsif ($line =~ /^\s*}/ && $in_block == 1) {
            $block_name = q{};
            $in_block = 0;
            next;
        }
        # variables
        elsif ($line =~ /=/) {
            $line =~ s/(?=\S)/$block_name./ if $block_name;
            $line =~ s{,?(\s*)(?=///|$)}{;$1};
        }
        else {
            next;
        }

        $result .= "$line\n";
    }

    close FH;
    return $result;
}

=head2 mark

This function will set the mark style. The default value is "--!".

=cut

=head1 AUTHOR

Alec Chen, C<< <alec at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-doxygen-lua at rt.cpan.org>, or through the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Doxygen-Lua>.  I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Doxygen::Lua

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Doxygen-Lua>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Doxygen-Lua>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Doxygen-Lua>

=item * Search CPAN

L<http://search.cpan.org/dist/Doxygen-Lua/>

=back

=head1 ACKNOWLEDGEMENTS

=head1 REPOSITORY

See http://github.com/alecchen/doxygen-lua

=head1 LICENSE AND COPYRIGHT

Copyright 2010 Alec Chen.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1; # End of Doxygen::Lua
