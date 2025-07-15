# Use official Node.js image
FROM node:18

WORKDIR /app

# Copy package.json and app.js from app/ folder
COPY app/package.json .
COPY app/app.js .

RUN npm install
CMD ["node", "app.js"]
