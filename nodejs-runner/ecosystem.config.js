module.exports = {
  apps: [
    {
      name: 'app',
      script: 'your-start-script.js', // Your start script
      args: `--port ${process.env.PORT}`, // Pass the port as an argument
      watch: true, // Enable watch mode
      // Additional PM2 options can be added here
    },
  ],
};
