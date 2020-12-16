FROM redis:6.0.9-alpine

COPY redis.conf /usr/local/etc/redis/redis.conf
COPY setpass.sh /usr/local/etc/redis/setpass.sh
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

