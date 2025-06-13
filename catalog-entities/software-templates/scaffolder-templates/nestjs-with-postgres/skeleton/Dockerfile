FROM --platform=linux/amd64 registry.access.redhat.com/ubi8/nodejs-18 AS build
COPY --chown=1001:0 package.json package-lock.json ./
RUN npm ci
COPY --chown=1001:0 . .
ENV NODE_ENV production
RUN npm run build

FROM --platform=linux/amd64 registry.access.redhat.com/ubi8/nodejs-18
COPY --chown=1001:0 --from=build /opt/app-root/src/node_modules ./node_modules
COPY --chown=1001:0 --from=build /opt/app-root/src/dist ./dist

EXPOSE 3000
CMD ["node", "dist/main.js"]
