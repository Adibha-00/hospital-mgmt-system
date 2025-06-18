# Use official Node.js image as a base
FROM node:18

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY ./package*.json .

# Install dependencies
RUN npm install

# Copy the rest of your application code into the container
COPY . .

# Expose the port your app will run on (5000 as per server.js)
EXPOSE 5000

# Command to start the application
CMD ["npm", "start"]
