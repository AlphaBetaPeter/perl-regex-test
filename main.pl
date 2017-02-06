#!/usr/bin/perl

use strict;
use warnings;

sub RunRegexTest {
	my($test_elements, $test_regex, $desc) = @_;
	print "\n\n";
	print "$desc\n";
	my $flat_array = join(", ", @$test_elements);
	print "Matching ($flat_array) with $test_regex\n";
	foreach my $to_test (@$test_elements){
		if($to_test =~ $test_regex){
			print "| x | $to_test\n";
		} else {
			print "|   | $to_test\n";
		}
	}
}

my @beginning_cases = ("Madrid","London","Mailand");
my $beginning_regex = qr/^Ma.*$/;
my $beginning_desc = "Beginning of the word";
RunRegexTest(\@beginning_cases, $beginning_regex, $beginning_desc);

my @two_cases = ("Madrid","London","New York", "More words with o");
my $two_regex = qr/^(.*o){2}.*$/;
my $two_desc = "Two letters in the string";
RunRegexTest(\@two_cases, $two_regex, $two_desc);

my @email_cases = ("12345\@bla.com", "bla");
my $email_regex = qr/^.*@.*\..*$/;
my $email_desc = "dumb email regex";
RunRegexTest(\@email_cases, $email_regex, $email_desc);

my @smartemail_cases = (
    "12_34-5\@bla.com",
    "bla",
    "robert%+foo\@dsda.com",
    "312312",
    "@@",
    "💩_doo\@foo.com"
);
my $smartemail_regex = qr/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b$/i;
my $smartemail_desc = "smart email regex";
RunRegexTest(\@smartemail_cases, $smartemail_regex, $smartemail_desc);

my @supersmart2012_cases = (
    "Pelé\@e.ee",
    "💩_doo\@foo.com",
    "💩_d.\@oo\@f-o_o.com",
    "💩_doo\@foo.com",
    "संपर्क@डाटामेल.भारत"
);
my $supersmart2012_regex = qr/^^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
my $supersmart2012_desc = "smart email regex";
RunRegexTest(\@supersmart2012_cases, $supersmart2012_regex, $supersmart2012_desc);

my @numletnum_cases = ("1234567e120", "1234567", "e", "e1");
my $numletnum_regex = qr/^\d+[a-z]{1}\d+$/;
my $numletnum_desc = "num single letter num regex";
RunRegexTest(\@numletnum_cases, $numletnum_regex, $numletnum_desc);

my @phonenums_cases = ("1234", "2112412431231231", "4912314234", "+494234234");
my $phonenums_regex = qr/^\+?\d{5,15}$/;
my $phonenums_desc = "dumb phonenumber";
RunRegexTest(\@phonenums_cases, $phonenums_regex, $phonenums_desc);