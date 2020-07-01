#loads nginx server
FROM nginx:alpine
#copies index.html viz in the repo to nginx
COPY index.html /usr/share/nginx/html/
#exposes the container's port 80
EXPOSE 80