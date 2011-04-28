package PubSub::Controller::PubSub;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

PubSub::Controller::PubSub - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched PubSub::Controller::PubSub in PubSub.');
}

sub subscribe :Path :Args(0) {
    my ($self, $c) = @_;
}

sub unsubscribe :Path :Args(0) {
    my ($self, $c) = @_;

}


=head1 AUTHOR

shabble

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
