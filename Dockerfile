# Tahap build
FROM node:18-alpine AS builder

WORKDIR /app

# Salin package dan install dependencies
COPY package*.json ./
RUN npm install

# Salin semua source code
COPY . .

# Build Vite project
RUN npm run build

# Tahap production serve pakai nginx
FROM nginx:alpine

# Hapus default nginx static folder
RUN rm -rf /usr/share/nginx/html/*

# Copy hasil build ke nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Jalankan nginx
CMD ["nginx", "-g", "daemon off;"]
