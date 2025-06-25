FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Copy file .env ke dalam container
COPY .env .env

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
