FROM ubuntu:24.04

# Install ttyd and common utilities
RUN apt-get update && apt-get install -y \
    ttyd \
    curl \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Set up an environment variable for the port Railway will assign
ENV PORT=8080
EXPOSE 8080

# CRITICAL FIX: Added the -W flag to make the terminal writable
CMD ["sh", "-c", "ttyd -W -p $PORT bash"]
