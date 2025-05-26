FROM node:18-alpine

WORKDIR /app

# Copy package info first
COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm

# Copy Prisma schema early so postinstall works
COPY prisma ./prisma

# Install dependencies
RUN pnpm install

# Copy the rest of the source
COPY . .

RUN pnpm build

EXPOSE 3000

CMD ["pnpm", "start"]


