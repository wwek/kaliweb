FROM wwek/kaliweb:latest

# Iinstall top10 package
RUN apt-get -yqq update && \
apt-get install -y \
aircrack-ng \
burpsuite \
hydra \
john \
maltego \
maltego-teeth \
metasploit-framework \
nmap \
sqlmap \
wireshark \
zaproxy \
zmap \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get install -y  \
    python-pip \
    python3 \
    python3-pip \
    golang \
    php7 \
    nodejs \
    yarn \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install vscode
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
&& sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
&& sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
&& sudo apt-get install apt-transport-https \
&& sudo apt-get update \
&& sudo apt-get install code # or code-insiders \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*