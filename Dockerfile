FROM jenkins/jenkins:lts-alpine

# Setup permissions for Jenkins data
USER root

RUN apk --update --no-cache add \
  docker && \
  rm -rf /var/cache/apk/*

# Install some Jenkins plugins
RUN /usr/local/bin/install-plugins.sh \
  ant \
  gradle \
  workflow-aggregator \
  checkstyle \
  docker-workflow \
  build-timeout \
  credentials-binding \
  ssh-agent \
  ssh-slaves \
  timestamper \
  ws-cleanup \
  cloverphp \
  crap4j \
  dry \
  htmlpublisher \
  jdepend \
  plot \
  pmd \
  violations \
  xunit

# Switch to the jenkins user
USER jenkins
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
