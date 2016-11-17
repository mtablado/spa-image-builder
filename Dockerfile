FROM docker-virtual.art.local/basic-image-builder:latest

ENV JENKINS_USER_HOME /home/jenkins
ARG ARTIFACTORY_BASE_URL="http://172.22.62.138:8081/artifactory"
ARG ARTIFACTORY_AUTH_KEY="Y2lfdXNlcjpBUDI0WDdwUzRZM1A4VHdQcVF0SDR5ZHRtdm8="

RUN echo ARTIFACTORY_BASE_URL=${ARTIFACTORY_BASE_URL}
RUN echo ARTIFACTORY_AUTH_KEY=${ARTIFACTORY_AUTH_KEY}

#versions
ARG VERSION_NPM="3.5.0"
ARG VERSION_GRUNT="v0.1.13"
ARG VERSION_NODE="4.2.2"
ARG VERSION_CHARM="1.0.1"
ARG VERSION_PROTRACTOR="3.0.0"
ARG VERSION_MOCHA="2.3.4"
ARG VERSION_NODESASS="3.8.0"

RUN printf 'registry='${ARTIFACTORY_BASE_URL}'/api/npm/npm-release/\n_auth="'${ARTIFACTORY_AUTH_KEY}'"\nalways-auth=true\nphantomjs_cdnurl='${ARTIFACTORY_BASE_URL}'/phantomjs-release\npython=/usr/bin/python\nsass-binary-site='${ARTIFACTORY_BASE_URL}'/node-sass-release\n' > ${JENKINS_USER_HOME}/.npmrc

RUN apt-get update \
	&& apt-get install -y nodejs npm 

# Solve node installation issue: http://stackoverflow.com/questions/18130164/nodejs-vs-node-on-ubuntu-12-04
RUN ln -s `which nodejs` /usr/bin/node

#RUN npm install -g bower \
#	&& npm install -g bower-art-resolver \
#	&& npm install -g mocha@$VERSION_MOCHA \
#	&& npm install -g grunt-cli@$VERSION_GRUNT \
##	&& npm install -g protractor@$VERSION_PROTRACTOR \
#	&& npm install -g node-sass@$VERSION_NODESASS \
#	&& npm install -g charm \
#	&& npm install -g karma

RUN npm install -g bower 
#RUN npm install -g bower-art-resolver 
RUN npm install -g mocha@$VERSION_MOCHA 
RUN npm install -g grunt-cli@$VERSION_GRUNT 
#RUN npm install -g protractor@$VERSION_PROTRACTOR 
RUN npm install -g node-sass
RUN npm install -g charm
RUN npm install -g grunt
RUN npm install -g karma

