FROM docker-virtual.art.local/basic-image-builder:latest
RUN apt-get update \
	&& apt-get install -y nodejs npm 
	
RUN npm install -g bower \
	&& npm install -g mocha \
	&& npm install -g grunt-cli \
	&& npm install -g charm 

