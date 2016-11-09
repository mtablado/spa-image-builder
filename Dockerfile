FROM docker-virtual.art.local/basic-image-builder:latest 

# Install npm, bower and grunt

RUN apt-get update 
	&& apt-get -y install nodejs npm
	&& ln -s "$(which nodejs)" /usr/bin/node
	&& npm install -g bower
	&& npm install -g grunt-cli

# "ln -s "$(which nodejs)" /usr/bin/node" This line is needed to fix a problem that has been around Ubuntu 14.04 (Mint 17 uses Ubuntu 14.04 codebase) 
# for a while. There is another Ubuntu program called node. Although not installed the name is reserved for that program. 
# What we have to do is creating the /usr/bin/node symlink to our currently installed node.js version.