package Redis::Easy;
use Moose;
use Redis;

our $VERSION = '0.01';

has '_redis' => (
    is => 'rw',
    isa => 'Redis',
    lazy => 1,
    default => sub {
        my $self = shift;
        Redis->new(
            server => $self->address.':'.$self->port,
            debug => $self->debug
        );
    }
);

has address => (
    is => 'rw',
    isa => 'Str',
    default => '127.0.0.1'
);

has debug => (
    is => 'rw',
    isa => 'Bool',
    default => 0
);

has port => (
    is => 'rw',
    isa => 'Int',
    default => 6379
);

sub auth {
    my ($self, $pass) = @_;

    my $res = $self->_redis->auth($pass);
    if($res eq 'OK') {
        return 1;
    }

    return 0;
}

sub get {
    my ($self, $key) = @_;

    return $self->_redis->get($key);
    #print STDERR "'$res'\n";
    # if($res eq 'OK') {
    #     return 1;
    # }
    # 
    # return 0;
    # return $res;
}

sub get_set {
    my ($self, $key, $value) = @_;

    return $self->_redis->getset($key, $value);
}

sub set {
    my ($self, $key, $val) = @_;

    my $res = $self->_redis->set($key, $val);
    if($res eq 'OK') {
        return 1;
    }

    return 0;
}

sub _process_response {
    my ($self, $resp) = @_;

    # if($resp =~ /^-(.*)$/) {
        # Error is in $1
    # } elsif($resp =~ /^+(.*)$/) {
        # Single line reply is in $1
    # }
}

1;

__END__;

=head1 NAME

Redis::Easy - The great new Redis::Easy!

=head1 VERSION

Version 0.01

=cut

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Redis::Easy;

    my $redis = Redis::Easy->new(
        address => '127.0.0.1', # default
        port => 6379,           # default
        debug => 1
    );

=head1 ATTRIBUTES

=head2 address

The address of the Redis server we intend to talk to.  Defaults to 127.0.0.1.

=head2 port

The port of the Redis server we intend to talk to. Defaults to 6379.

=head2 debug

To debug or not to debug, that is the question.

=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

