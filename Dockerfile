FROM nginx:alpine

ENV PORT 8080
ENV HOST 0.0.0.0

COPY src /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.template
COPY docker-entrypoint.sh /docker-entrypoint.sh


ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "nginx", "-g", "daemon off;" ]