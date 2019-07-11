####### WRITTEN BY : YADU MATHUR ########################
####### CAPTURE NETWORK TRAFFIC And get in MBPS ##############
#MIT License

#Copyright (c) 2019 Yadu Mathur
#!/usr/bin/perl
use strict;
use warnings;
#using Hires
use Time::HiRes;
#use sockets
use IO::Socket::INET;




### SET UP THE TIME LIMIT
my $time_check = 5.0; # seconds
my $bytestostart = 0;
my $start_time = [Time::HiRes::gettimeofday()];


#Flushed 
STDOUT->autoflush(1);


 

while (<>) {
  if (/ length (\d+):/) {

    $bytestostart += $1;

    my $passedseconds = Time::HiRes::tv_interval($start_time);

    if ($passedseconds > $time_check) {

       my $bips = $bytestostart / $passedseconds;

       my $mbps = $bips / 1024;
      
  #compute 
  
	printf "%10d %10.2f\n", (time()),$mbps;
       $start_time = [Time::HiRes::gettimeofday()];

       $bytestostart = 0;


    }
  }
}
