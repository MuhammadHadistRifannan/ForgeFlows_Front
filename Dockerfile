# Stage 1 - Build
FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

ENV NODE_OPTIONS="--max-old-space-size=384"

RUN npm run build

# Stage 2 - Production
FROM nginx:stable-alpine

COPY --from=builder /app/out /usr/share/nginx/html

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]