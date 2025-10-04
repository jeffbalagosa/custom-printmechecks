# Build stage
FROM node:18-alpine AS build
WORKDIR /app
# Install dependencies first (better layer caching)
COPY package.json package-lock.json* pnpm-lock.yaml* yarn.lock* .npmrc* ./
RUN npm ci || npm install
# Copy source
COPY . .
# Build
RUN npm run build

# Runtime stage: Nginx to serve the built SPA
FROM nginx:1.27-alpine AS runtime
# Copy built assets
COPY --from=build /app/dist /usr/share/nginx/html
# Provide nginx config with SPA fallback
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Expose port
EXPOSE 8080
# Run nginx (default entrypoint/cmd already does)
