# Use an official Node.js runtime as a parent image
FROM node:18 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json
COPY ../hospital-mgmt-frontend/package.json ./ 

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY ../hospital-mgmt-frontend/. ./ 

# Build the React app for production
RUN npm run build

# Use a lightweight web server (Nginx) to serve the React app
FROM nginx:alpine

# Copy the build files to the Nginx container
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to access the app
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
