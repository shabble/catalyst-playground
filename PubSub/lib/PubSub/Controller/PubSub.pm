package PubSub::Controller::PubSub;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

use Data::Dumper;

=head1 NAME

PubSub::Controller::PubSub - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path('/') :Args(0) {
    my ( $self, $c ) = @_;

    #$c->forward('subscribe.tt2')
    $c->stash(template => 'PubSub/subscribe.tt2');
}


sub test :Path('/test') :Args(0) {
    my ($self, $c) = @_;

    my $be = $c->model('PubSub::BackEnd');

    my @things = (
                "http://www.example.com",
                "thingie",
                "subscribe",
                "http://localhost:300/callback"
               );

    my $data = $be->prepare_data(@things);

    #$c->log->info(Dumper($data));

    $c->stash(hubdata => $data);
    $c->stash(template => 'PubSub/test.tt2');
}

sub subscribe :Path :Args(0) {
    my ($self, $c) = @_;
}

sub unsubscribe :Path :Args(0) {
    my ($self, $c) = @_;

}

sub callback :Path('/callback') :Args(1) {
    my ($self, $c, $data) = @_;


    $c->log->warn("Got callback: $data");
}


__PACKAGE__->meta->make_immutable;

1;
