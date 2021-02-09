FROM node:14.15.4-alpine3.12

ENV PORT 3000

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Installing dependencies
COPY package.json /app/
COPY yarn.lock /app/
RUN yarn

# Copying source files
COPY . /app

# Building app
RUN yarn build
EXPOSE 3000

# Running the app
CMD ["yarn" ,"start",  "-H", "0.0.0.0"]