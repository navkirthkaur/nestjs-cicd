# Dockerfile

# Step 1: Base Image
FROM node:18

# Step 2: Set working directory
WORKDIR /usr/src/app

# Step 3: Copy package.json and package-lock.json
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of your application code
COPY . .

# Step 6: Build the application
RUN npm run build

# Step 7: Expose the port (Environment Variable OR default 5000)
ARG API_PORT=5000
ENV API_PORT=${API_PORT}
EXPOSE ${API_PORT}

# Step 8: Start the application
CMD ["npm", "run", "start:prod"]
