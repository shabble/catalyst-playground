use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyApp';
use MyApp::Controller::Books;

ok( request('/books')->is_redirect, 'Request should succeed' );
done_testing();
