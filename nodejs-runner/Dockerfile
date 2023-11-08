ARG BUILD_FROM
FROM $BUILD_FROM

# Install Node.js, npm, Git
RUN apk add --no-cache nodejs npm git

# Set work directory
WORKDIR /app

# Copy the run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

EXPOSE 5000
