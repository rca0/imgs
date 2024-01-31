# Use the latest Ubuntu image
FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y libpq-dev awscli postgresql-client wget jq vim curl git asdf ca-certificates

# Install asdf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0 && \
    echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc && \
    echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

# Install asdf plugins for Terraform, Python, Golang, and Node.js
RUN asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp.git && \
    asdf plugin-add python https://github.com/danhper/asdf-python.git && \
    asdf plugin-add golang https://github.com/kennyp/asdf-golang.git && \
    asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# Set default versions for asdf plugins
RUN asdf install terraform latest && \
    asdf install python latest && \
    asdf install golang latest && \
    asdf install nodejs latest

# Set global versions for asdf plugins
RUN asdf global terraform $(asdf list terraform | tail -1) && \
    asdf global python $(asdf list python | tail -1) && \
    asdf global golang $(asdf list golang | tail -1) && \
    asdf global nodejs $(asdf list nodejs | tail -1)

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Start a bash shell when the container runs
CMD ["bash"]

