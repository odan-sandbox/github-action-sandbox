FROM node

WORKDIR /app

COPY . .

RUN yarn install
RUN yarn lint
RUN yarn build
