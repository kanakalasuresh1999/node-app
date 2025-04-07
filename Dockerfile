FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Copy app files
COPY . .

# Install dependencies
RUN npm install

# Expose the port the app runs on
EXPOSE 3001

# Command to run the app
CMD ["node", "index.js"]

