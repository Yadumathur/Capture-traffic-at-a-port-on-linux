# Capture-traffic-at-a-port-on-linux

Capture the Network traffic from any port and send to ELK stack to view on dash

Set up ELK stack , start Elastic and Kibana on the local / cluster
In parse.conf set up the path of your
input { file{ path => ["/Users/y0m00jc/MyDevWork/file.log"] type => "file" start_position => "beginning" #sincedb_path => "/Users/y0m00jc/MyDevWork/logstash-6.0.0" } }

filter{

grok { match => { "message" => [ "%{NUMBER:logtime}%{SPACE}%{NUMBER:mbps:float}" ] } }

date { match => ["logtime", "UNIX"] target => "@timestamp" }

}

output { stdout { codec => rubydebug } elasticsearch { hosts => "localhost:9200" index => "net_new" } }

Once you set up correct details , you can launch the perl code like as below sudo tcpdump -l -e -n | grep 22 | perl testnetwork.pl >> file1.log

And post this start the logstash as below

bin/logstash -f parse.conf

Go to Kibana and and search for index what you have given in parse.conf as We have net_new use the same and select

Now you can create your own dashboard against time over the MBPS on port 22.
