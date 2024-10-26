FROM ubuntu:latest

WORKDIR /app
# Update the package list and install FFmpeg
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./package.json ./package.json

RUN "node -v"
RUN "npm install"

COPY . .

# Define the command hat keeps the container running (for example)
CMD ["npm", "run", "start"]

