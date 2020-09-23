module.exports = {
  // Server authentication info
  servers: {
    main: {
      host: "54.153.26.18",
      username: "ubuntu",
      pem: "~/aws/mbp.pem"
    }
  },
  app: {
    name: "photos",
    path: '../',
    docker: {
      image: 'abernix/meteord:node-12-base'
    },
    path: "~/Development/photos",
    servers: {
      main: {}
    },
    env: {
      ROOT_URL: "https://alexhancock.com"
    },
    deployCheckWaitTime: 120,
  },
  proxy: {
    servers: {
      main: {}
    },
    domains: 'alexhancock.com,www.alexhancock.com',
    ssl: {
      letsEncryptEmail: 'alex@alexhancock.com'
    }
  },
  mongo: {
    version: '2.6.8',
    servers: {
      main: {}
    }
  }
}
