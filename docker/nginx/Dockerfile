FROM nginx:1.25.3-alpine

COPY default-subdomain.conf /etc/nginx/conf.d/default.conf.template

COPY docker-entrypoint.sh /

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
