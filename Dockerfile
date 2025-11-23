FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```

### 1.4 Create .dockerignore

Create `.dockerignore`:
```
node_modules
npm-debug.log
.git
.gitignore
README.md
