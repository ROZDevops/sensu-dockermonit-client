FROM hiroakis/docker-sensu-server

RUN apt-get install python && \
  mkdir -p /etc/sensu/plugins/

ADD supervisor.conf /etc/supervisord.conf
ADD config.json /tmp/sensu/config.json
ADD client.json /tmp/sensu/conf.d/client.json
ADD run-sensu-client.sh /opt/run-sensu-client.sh
ADD get-docker-stats.sh /etc/sensu/plugins/get-docker-stats.sh

RUN chmod 700 /opt/run-sensu-client.sh
ENTRYPOINT ["/opt/run-sensu-client.sh"]