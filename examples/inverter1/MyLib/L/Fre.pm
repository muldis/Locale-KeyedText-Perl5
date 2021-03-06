use 5.008000;
use utf8;
use strict;
use warnings;

###########################################################################
###########################################################################

my $TEXT_STRINGS = {
    'MYLIB_MYINV_NO_ARG' => q[my_invert(): paramètre $number est manquant],
    'MYLIB_MYINV_BAD_ARG'
        => q[my_invert(): paramètre $number est ne nombre,]
           . q[ il est "<GIVEN_VALUE>"],
    'MYLIB_MYINV_RES_INF'
        => q[my_invert(): aboutir a est infini parce que]
           . q[ paramètre $number est zero],
};

{ package MyLib::L::Fre; # module
    sub get_text_by_key {
        my (undef, $msg_key) = @_;
        return $TEXT_STRINGS->{$msg_key};
    }
} # module MyLib::L::Fre

###########################################################################
###########################################################################

1;
