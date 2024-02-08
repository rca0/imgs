# Use the latest Ubuntu image
FROM ubuntu:latest

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

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
    unzip \
    ca-certificates \
    openjdk-8-jdk

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the external entrypoint.sh script into the image
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
