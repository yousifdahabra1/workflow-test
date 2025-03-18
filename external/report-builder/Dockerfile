# Use the official Node.js image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the app's source code
COPY . .

# Expose the port Cloud Run will use
EXPOSE 8080

# Start the app using the start script from package.json
CMD ["npm", "start"]
