use 5.008000;
use utf8;
use strict;
use warnings;

###########################################################################
###########################################################################

my $TEXT_STRINGS = {
    'MYAPP_HELLO' => q[Welcome to MyApp.],
    'MYAPP_GOODBYE' => q[Goodbye!],
    'MYAPP_PROMPT'
        => q[Enter a number to be inverted, or press ENTER to quit.],
    'MYAPP_RESULT' => q[The inverse of "<ORIGINAL>" is "<INVERTED>".],
};

{ package MyApp::L::Eng; # module
    sub get_text_by_key {
        my (undef, $msg_key) = @_;
        return $TEXT_STRINGS->{$msg_key};
    }
} # module MyApp::L::Eng

###########################################################################
###########################################################################

1;
