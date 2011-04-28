#!/usr/bin/perl

use strict;
use warnings;

use lib ('.', './lib');

use MyApp::Schema;

my $schema = MyApp::Schema->connect('dbi:SQLite:db/myapp.db');

my @users = $schema->resultset('User')->all;

foreach my $user (@users) {
    $user->password('mypass');
    $user->update;
}
