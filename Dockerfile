# Base image
FROM node:18

# Sets the working directory inside the container to /app, where the application code will reside
WORKDIR /app

# Transfers the package.json and package-lock.json files from the host to the /app directory in the container.
COPY package*.json ./

# Installs application dependencies within the container using the specified package.json.
RUN npm install

#  Copies the application code from the host to the /app directory in the container.
COPY . .

# Executes the npm run build command within the container to build the application.
RUN npm run build

# Specifies the command to initiate when the container launches, which starts the server in development mode.
CMD ["npm", "run", "start:dev"]
