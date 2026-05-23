FROM ubuntu:24.04

# Install ttyd and common utilities
RUN apt-get update && apt-get install -y \
    ttyd \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set up an environment variable for the port Railway will assign
ENV PORT=8080
EXPOSE 8080

# Start ttyd and bind it to a bash shell
CMD ["sh", "-c", "ttyd -p $PORT bash"]
