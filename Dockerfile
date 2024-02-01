# Use the latest Ubuntu image
FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y libpq-dev \
    awscli \
    postgresql-client \
    wget \
    jq \
    vim \
    curl \
    git \
    ca-certificates \
    openjdk-8-jdk

# Install asdf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0

# Copy the external entrypoint.sh script into the image
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
