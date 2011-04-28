use strict;
use warnings;
use Test::More;


use Catalyst::Test 'PubSub';
use PubSub::Controller::PubSub;

ok( request('/pubsub')->is_success, 'Request should succeed' );
done_testing();
