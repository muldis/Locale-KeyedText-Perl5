use 5.008001;
use utf8;
use strict;
use warnings;

use Test::More 0.92;

use lib 't/lib';
use t_LKT_Util;
use Locale::KeyedText;

t_LKT_Util->message( 'testing new_message() and Message object methods' );

my ($did, $should, $msg1);

$did = t_LKT_Util->serialize( t_LKT_Util->new_message( undef ) );
$should = 'undef, ';
is( $did, $should, "t_LKT_Util->new_message( undef ) returns '$did'" );

$msg1 = t_LKT_Util->new_message( q{} );
isa_ok( $msg1, 'Locale::KeyedText::Message',
    q|msg1 = new_message( q{} ) ret MSG obj| );
$did = $msg1->as_debug_str();
$should = ': ';
is( $did, $should, "on init msg1->as_debug_str() returns '$did'" );

$msg1 = t_LKT_Util->new_message( '0' );
isa_ok( $msg1, 'Locale::KeyedText::Message',
    q|msg1 = new_message( '0' ) ret MSG obj| );
$did = $msg1->as_debug_str();
$should = '0: ';
is( $did, $should, "on init msg1->as_debug_str() returns '$did'" );

$msg1 = t_LKT_Util->new_message( 'zZ9' );
isa_ok( $msg1, 'Locale::KeyedText::Message',
    q|msg1 = new_message( 'zZ9' ) ret MSG obj| );
$did = $msg1->as_debug_str();
$should = 'zZ9: ';
is( $did, $should, "on init msg1->as_debug_str() returns '$did'" );

$msg1 = t_LKT_Util->new_message( 'foo', undef );
isa_ok( $msg1, 'Locale::KeyedText::Message',
    q|msg1 = new_message( 'foo', undef ) ret MSG obj| );
$did = $msg1->as_debug_str();
$should = 'foo: ';
is( $did, $should, "on init msg1->as_debug_str() returns '$did'" );

$msg1 = t_LKT_Util->new_message( 'foo', {} );
isa_ok( $msg1, 'Locale::KeyedText::Message',
    q|msg1 = new_message( 'foo', {} ) ret MSG obj| );
$did = $msg1->as_debug_str();
$should = 'foo: ';
is( $did, $should, "on init msg1->as_debug_str() returns '$did'" );

$msg1 = t_LKT_Util->new_message( 'foo', { q{} => 'g' } );
isa_ok( $msg1, 'Locale::KeyedText::Message',
    q|msg1 = new_message( 'foo', { q{} => 'g' } ) ret MSG obj| );
$did = $msg1->as_debug_str();
$should = 'foo: =g';
is( $did, $should, "on init msg1->as_debug_str() returns '$did'" );

$msg1 = t_LKT_Util->new_message( 'foo', { 'bar' => 'baz' } );
isa_ok( $msg1, 'Locale::KeyedText::Message',
    q|msg1 = new_message( 'foo', { 'bar' => 'baz' } ) ret MSG obj| );
$did = $msg1->as_debug_str();
$should = 'foo: bar=baz';
is( $did, $should, "on init msg1->as_debug_str() returns '$did'" );

$msg1 = t_LKT_Util->new_message( 'foo', { 'bar'=>'baz','c'=>'-','0'=>'1','z'=>q{},'y'=>'0' } );
isa_ok( $msg1, 'Locale::KeyedText::Message',
    q|msg1 = new_message( 'foo', { 'bar'=>'baz','c'=>'d','0'=>'1','z'=>q{},'y'=>'0' } ) ret MSG obj| );
$did = $msg1->as_debug_str();
$should = 'foo: 0=1, bar=baz, c=-, y=0, z=';
is( $did, $should, "on init msg1->as_debug_str() returns '$did'" );

$did = t_LKT_Util->serialize( $msg1->get_msg_key() );
$should = q|'foo', |;
is( $did, $should, "on init msg1->get_msg_key() returns '$did'" );

$did = t_LKT_Util->serialize( $msg1->get_msg_var( undef ) );
$should = 'undef, ';
is( $did, $should, "on init msg1->get_msg_var( undef ) returns '$did'" );

$did = t_LKT_Util->serialize( $msg1->get_msg_var( q{} ) );
$should = 'undef, ';
is( $did, $should, "on init msg1->get_msg_var( q{} ) returns '$did'" );

$did = t_LKT_Util->serialize( $msg1->get_msg_var( '0' ) );
$should = q|'1', |;
is( $did, $should, "on init msg1->get_msg_var( '0' ) returns '$did'" );

$did = t_LKT_Util->serialize( $msg1->get_msg_var( 'zzz' ) );
$should = 'undef, ';
is( $did, $should, "on init msg1->get_msg_var( 'zzz' ) returns '$did'" );

$did = t_LKT_Util->serialize( $msg1->get_msg_var( 'bar' ) );
$should = q|'baz', |;
is( $did, $should, "on init msg1->get_msg_var( 'bar' ) returns '$did'" );

$did = t_LKT_Util->serialize( $msg1->get_msg_vars() );
$should = q|{ '0' => '1', 'bar' => 'baz', 'c' => '-', 'y' => '0', 'z' => q{}, }, |;
is( $did, $should, "on init msg1->get_msg_vars() returns '$did'" );

done_testing();

1;
