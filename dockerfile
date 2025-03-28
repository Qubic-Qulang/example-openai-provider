FROM node:18-alpine

WORKDIR /app
COPY package*.json ./
RUN npm install -g pnpm
RUN pnpm install
COPY . .
RUN pnpm run build

ENV NODE_ENV=production
ENV PATH=/app/node_modules/.bin:$PATH
ENV PORT=3001
EXPOSE 3001
CMD ["pnpm", "start"]
