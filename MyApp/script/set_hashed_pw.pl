#!/usr/bin/perl

use strict;
use warnings;
use feature qw/say/;

use lib ('.', './lib');

use MyApp::Schema;

my $schema = MyApp::Schema->connect('dbi:SQLite:db/myapp.db');

my @users = $schema->resultset('User')->all;

foreach my $user (@users) {
    my $original_password = $user->password();
    #say "User: " . $user->username() . " has pw: " . $user->password();
    $user->password($original_password);
    $user->update;
}
