#!/usr/bin/perl

use Test::More tests => 4;

use Integrator::Module::Build;
my $build = Integrator::Module::Build->current;

# object returns something
ok ( defined $build,						'object can be instanciated' );

$build->config_data('simple' => 'stuff');
is ( $build->config_data('simple'), 'stuff',			'hash value is added');

$build->config_data('simple' => 'changed_for_this');
is ( $build->config_data('simple'), 'changed_for_this',		'hash value is modified');

# complex values
my $href = {
		'bonsoir'	=> 'a toi',
		'table'		=> [1..10],
		'another_hash'	=> {
					'color' => 'blue',
					'shape' => 'round',
					'coord' => [2.234, 4.33]
				   }
	   };
$build->config_data('complex' => $href);

my %hash = %{$href};		#taking a copy
is_deeply ( $build->config_data('complex'), \%hash,		'complex data structure is properly saved');
