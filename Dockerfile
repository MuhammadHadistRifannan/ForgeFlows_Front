# STAGE 1: Build dalam Kontainer
FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

# KUNCI KESELAMATAN:
# Membatasi heap Node.js max 384 MB agar tidak spiking ke 1 GB saat build
ENV NODE_OPTIONS="--max-old-space-size=384"
RUN npm run build