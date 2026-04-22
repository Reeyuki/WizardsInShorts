FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    ca-certificates \
    libstdc++6 \
    libgcc-s1 \
    libglib2.0-0 \
    libx11-6 \
    libxcursor1 \
    libxinerama1 \
    libxrandr2 \
    libxi6 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY server.x86_64 /app/server.x86_64
COPY server.pck /app/server.pck

RUN chmod +x /app/server.x86_64

ENV GODOT_PATH=/app

EXPOSE 7777

CMD ["sh", "-c", "./server.x86_64 --headless --server --port ${PORT:-7777}"]
