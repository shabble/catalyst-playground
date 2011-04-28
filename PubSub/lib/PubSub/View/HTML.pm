package PubSub::View::HTML;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config
  (
   render_die         => 1,
   INCLUDE_PATH       => [ PubSub->path_to('root', 'src') ],
   TIMER              => 1,
   WRAPPER            => 'wrapper.tt2',
);

=head1 NAME

PubSub::View::HTML - TT View for PubSub

=head1 DESCRIPTION

TT View for PubSub.

=head1 SEE ALSO

L<PubSub>

=head1 AUTHOR

shabble

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
