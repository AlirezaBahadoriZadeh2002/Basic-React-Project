FROM hub.hamdocker.ir/node:lts-alpine as builder

WORKDIR /app
COPY package.json .

RUN npm install
COPY . .
RUN npm run build

FROM hub.hamdocker.ir/nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html
