package MyApp::Controller::PubSub;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

MyApp::Controller::PubSub - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched MyApp::Controller::PubSub in PubSub.');
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

=pod

=head1 How PubSub Works:

=head2 Entities

=head3 Hub

Thing that does the polling of the source, and the callbacks to the
target when stuff changes.

=head3 Source (Feed)

Any Atom (or RSS?) feed URL, which is given to the Hub to poll

=head3 Client(s)

A publically accessible URL which the Hub pushes data to (sends a GET)
when data from the Source is available.

=head2 Protocol

=over 4

=item 1

Client Sends a subscribe request to a Hub, specifying both its callback URL,
and the URL of the Feed it wishes to observe.

Client may fetch the Feed directly, and parse it looking for a Hub URL, avoiding
the need for a 3rd party Hub.

=item 2

The request to the Hub is made as a POST transaction, with a number of fields
encoded within the form parameters.  These fields are:

hub.calback - The URL to which the Hub will return push notifications
hub.mode    - subscribe/unsubscribe
hub.topic   - The URL of the Source.
hub.verify  - sync or async.
hub.lease_seconds - how long the subscription will last before it must be renewed.
hub.secret  - an entirely client-secret token returned by the Hub as proof of receipt
hub.verify_token - unsure

The Hub is expected to return a 202 or 204 response code to this POST.
Anything else is an error.

=item 3

The Hub sends a GET (POST?)  request to the hub.callback URL

=back

=cut
