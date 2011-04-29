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

sub subscription_create :Local :Args(0) {
    my ($self, $c) = @_;

    my $src  = $c->request->params->{source};
    my $hub  = $c->request->params->{hub};
    my $call = $c->request->params->{callback};

    my $subs = $c->model('DB::Subscription');

    my $backend = $c->model('PubSub::BackEnd');
    my $params  = $backend->prepare_data($hub, $src, 'verify', $call);


    my $new = $subs->create
      ({
        source => $src,
        status => 'pending',
        uuid   => $params->{'hub.verify_token'},
        topic  => $src
       });

    my $res = $backend->post_request_source($hub, $params);

    if ($res->code == 202 or $res->code == 204) {
        $c->log->warn("Created!");
    } else {
        $c->log->warn("Failed");
    }

    $c->stash(query_result => $res, obj => $new);
    $c->stash(template => 'PubSub/subscription_create.tt2');
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
