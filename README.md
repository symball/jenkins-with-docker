# Jenkins

Based on the official Alpine LTS build of Jenkins, [jenkins/jenkins:lts-alpine](https://hub.docker.com/r/jenkins/jenkins/), this image installs Docker natively from Alpine. In order to function properly, it is necessary to link the Docker socket from the native host to the appropriate location `/var/run/docker.sock` or appropriate.

In terms of predownloaded Jenkins plugins, it comes prepared with:

- ant
- gradle
- workflow-aggregator
- checkstyle
- docker-workflow
- build-timeout
- credentials-binding
- ssh-agent
- ssh-slaves
- timestamper
- ws-cleanup
- cloverphp
- crap4j
- dry
- htmlpublisher
- jdepend
- plot
- pmd
- violations
- xunit