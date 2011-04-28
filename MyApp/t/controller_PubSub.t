use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyApp';
use MyApp::Controller::PubSub;

ok( request('/pubsub')->is_success, 'Request should succeed' );
done_testing();
