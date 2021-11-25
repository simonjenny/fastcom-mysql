FROM node:14-slim

RUN apt update \
    && apt install -y wget gnupg mysql-client bc \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt update \
    && apt install -y google-chrome-stable libxss1 \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN npm i puppeteer \
    && groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /node_modules

WORKDIR /usr/src/app
RUN npm i fast-cli

COPY run /usr/src/app/run
RUN chmod a+x /usr/src/app/run

WORKDIR /usr/src/app
CMD /usr/src/app/run