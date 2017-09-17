FROM jenkins/jenkins:lts-alpine

# Setup permissions for Jenkins data
USER root
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.6/community" >> /etc/apk/repositories && \
  apk --update --no-cache add \
  apache-ant \
  bash \
  ca-certificates \
  curl \
  docker \
  git \
  libsasl \
  openssh \
  ruby \
  wget && \
  rm -rf /var/cache/apk/*

# Copy the plugin installer across again in order to add debug to the curl call
USER jenkins

# ENV CURL_CONNECTION_TIMEOUT 60
# ENV JENKINS_UC_DOWNLOAD https://mirrors.tuna.tsinghua.edu.cn/jenkins

# Install some Jenkins plugins
RUN /usr/local/bin/install-plugins.sh \
  github-organization-folder \
  build-timeout \
  checkstyle \
  cloverphp \
  crap4j \
  credentials-binding \
  docker-workflow \
  dry \
  email-ext \
  external-monitor-job \
  git \
  github \
  github-api \
  gradle \
  htmlpublisher \
  jdepend \
  ldap \
  matrix-auth \
  pam-auth \
  plot \
  pmd \
  ssh-agent \
  ssh-slaves \
  subversion \
  timestamper \
  violations \
  windows-slaves \
  workflow-aggregator \
  ws-cleanup \
  xunit \
  ant \
  antisamy-markup-formatter  \
  github-branch-source \
  mapdb-api \
  yet-another-docker-plugin


# Switch to the jenkins user
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
