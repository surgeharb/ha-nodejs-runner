ARG BUILD_FROM
FROM $BUILD_FROM

# Install Node.js, npm, Git, and PM2
RUN apk add --no-cache nodejs npm git && \
    npm install -g pm2

# Set work directory
WORKDIR /app

# Copy the run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

EXPOSE 3000-4000
