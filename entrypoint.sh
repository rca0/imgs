#!/bin/bash

# Source asdf
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# Install asdf plugins for Terraform, Python, Golang, and Node.js
asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp.git
asdf plugin-add python https://github.com/danhper/asdf-python.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# Install default versions for asdf plugins
asdf install terraform latest
asdf install python latest
asdf install golang latest
asdf install nodejs latest

# Set global versions for asdf plugins
asdf global terraform $(asdf list terraform | tail -1)
asdf global python $(asdf list python | tail -1)
asdf global golang $(asdf list golang | tail -1)
asdf global nodejs $(asdf list nodejs | tail -1)

# Set Java 8 as the default Java version
update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
update-alternatives --set javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac

# If argument is not related, we assume that
# user wants to run his own process, for example
# a "bash" shell to explore this image
exec "$@"
