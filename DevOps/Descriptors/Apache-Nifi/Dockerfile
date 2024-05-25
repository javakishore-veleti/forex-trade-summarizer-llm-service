FROM apache/nifi:latest

# Set environment variables

ENV NIFI_WEB_HTTP_PORT=8080
ENV NIFI_WEB_HTTP_HOST=0.0.0.0
ENV JAVA_OPTS="-Xms512m -Xmx1g"
ENV NIFI_SENSITIVE_PROPS_KEY="forex-trade-summarizer-apache-nfi"
ENV NIFI_HOME=/opt/nifi/nifi-current
ENV NIFI_DATABASE_REPOSITORY_PATH=/opt/nifi/database_repository
ENV NIFI_AUDIT_LOGGING_ENABLED=false

# Copy custom configuration files (optional)
COPY conf/nifi.properties /opt/nifi/nifi-current/conf/nifi.properties
# COPY conf/bootstrap.conf /opt/nifi/nifi-current/conf/bootstrap.conf
# COPY conf/logback.xml /opt/nifi/nifi-current/conf/logback.xml

# (Optional) Copy your custom NAR files (extensions)
# COPY extensions/*.nar /opt/nifi/nifi-current/lib/

# (Optional) Create a persistent volume for flow.xml.gz and content repository
VOLUME /opt/nifi/nifi-current/conf/flow.xml.gz
VOLUME /opt/nifi/nifi-current/content_repository
VOLUME /opt/nifi/database_repository

# (Optional) Set permissions for the volumes
#RUN chown -R nifi:nifi /opt/nifi/nifi-current/conf/flow.xml.gz
#RUN chown -R nifi:nifi /opt/nifi/nifi-current/content_repository

EXPOSE 8080
EXPOSE 9092

# Start NiFi
CMD ["/opt/nifi/nifi-current/bin/nifi.sh", "run"]
