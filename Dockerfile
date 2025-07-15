# Use official Node.js image
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and app.js from the app folder
COPY ../app/package.json ./package.json
COPY ../app/app.js ./app.js

# Install dependencies
RUN npm install

# Start the application
CMD ["node", "app.js"]
