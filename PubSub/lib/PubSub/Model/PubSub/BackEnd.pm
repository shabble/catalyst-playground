package PubSub::Model::PubSub::BackEnd;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model';

use LWP;
use LWP::UserAgent;
use UUID::Random;

sub send_hub_request {
    my ($self, $hub_url) = @_;
    
}


sub prepare_data {
    my ($self, $hub, $topic, $mode, $callback) = @_;

    my $token = UUID::Random->generate();

    my $data
      = {
         'hub.callback'      => $callback,
         'hub.mode'          => $mode,
         'hub.topic'         => $topic,
         'hub.verify'        => 'async',
         'hub.lease_seconds' => '',
         'hub.verify_token'  => $token
        };

    return $data;
}

sub post_request_source {
    my ($self, $hub_url, $data) = @_;

    my $ua = LWP::UserAgent->new;
    $ua->agent("ShabApp/0.1");

    my $response = $ua->post($hub_url, $data);

    return $response;

    # if ($response->code == 202 or $response->code == 204) {
    # } else {
    #     # something fucked up.
    # }
}

__PACKAGE__->meta->make_immutable;

1;
