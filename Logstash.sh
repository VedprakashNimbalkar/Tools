
echo  "deb http://packages.elasticsearch.org/logstash/1.3/debian stable main" >> /etc/apt/sources.list
wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -

apt-get install logstash -y

cat <<EOT >> /etc/logstash/conf.d/agent.conf
input {
        file {
                type => "message"
                path => "/var/log/message"
                start_position => beginning
                tags => "system logs"
        }
}
output {
stdout { }
        redis {
                host => "<Logstash Server IP>"
                port => <Logstash Port>
                data_type => "list"
                key => "logstash"
        }
}

####$$$$

EOT

