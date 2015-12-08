use warnings;
use strict;
use ZWave::Protocol;
use Test::More;
use Log::Log4perl qw(:easy);

Log::Log4perl->easy_init($DEBUG);

my $zwave = ZWave::Protocol->new;
my $cks = $zwave->checksum( 1, 2, 3 );

is $cks, 0xfd, "checksum";

$zwave->connect();

my $node_id = 3;
my $state   = 255; # "on"

$zwave->payload_transmit( 0, 0x13, $node_id, 
                  0x03, 0x20, 0x01, $state, 0x05 );

done_testing;
