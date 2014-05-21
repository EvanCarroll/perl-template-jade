#!/usr/bin/perl
use strict;
use warnings;
use lib 'lib';

use Test::More tests => 4;
use Template::Jade qw(:all);
use HTML::Escape;

{

	my $text = render(<<'EOF'
	p.class#id(foo='bar') baz
EOF
);
	$text =~ s/\s+//gm;

	subtest "Element with attribute, content, implicit id, and class" => sub {
		plan tests => 4;
		like( $text, qr/>baz</, 'content' );
		like( $text, qr/id="id"/, 'id' );
		like( $text, qr/class="class"/, 'class' );
		like( $text, qr/foo="bar"/, 'attribute' );
	}

}

{

	my $text = render(<<'EOF'
	.foo bar
EOF
);
	$text =~ s/\s+//gm;

	subtest "implicit div" => sub {
		plan tests => 2;
		like( $text, qr/<divclass="foo">/, 'implicit div tag' );
		like( $text, qr/bar/, 'text' );
	}

}

{

	my $text = render(<<'EOF'
	p(initial-foo="bar=baz").
		this
		is
		a
		test
EOF
);
	$text =~ s/\s+//gm;

	like( $text, qr'<pinitial-foo="bar=baz">thisisatest</p>', 'block comments' );

}

{

	my $text = render(<<'EOF'
	div.asdf
		- print "foo";
	h2 Add User
EOF
);
	$text =~ s/\s+//gm;

	like( $text, qr'<divclass="asdf">foo</div><h2>AddUser</h2>', 'perl expression works' );

}

__END__
