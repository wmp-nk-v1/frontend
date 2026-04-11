# Stage 1: Build
FROM          docker.io/library/node:22 AS builder
WORKDIR       /app
COPY          ./ /app/
RUN           npm ci && npm run build

FROM          docker.io/library/nginx
COPY          --from=builder /app/dist/assets/ /usr/share/nginx/html/assets/
COPY          --from=builder /app/dist/index.html /usr/share/nginx/html/index.html
COPY          nginx.conf /etc/nginx/nginx.conf