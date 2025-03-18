# Use official Node.js LTS image
FROM node:18

# Install git
RUN apt-get update && apt-get install -y git

# Install gsutil
RUN curl -sSL https://sdk.cloud.google.com | bash

ENV PATH="$PATH:/root/google-cloud-sdk/bin"

# Install yq latest version
RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package.json ./

# Install app dependencies
RUN npm install --only=production

# Bundle app source
COPY app.js script.sh ./

# Make the bash script executable
RUN chmod +x script.sh

# Expose the port the app runs on
EXPOSE 443

# Define environment variable
ENV PORT=443

# Start the Node.js server
CMD [ "npm", "start" ]

