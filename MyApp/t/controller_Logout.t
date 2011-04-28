use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyApp';
use MyApp::Controller::Logout;

ok( request('/logout')->is_redirect, 'Request should succeed' );
done_testing();
