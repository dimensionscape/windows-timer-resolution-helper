# windows timer resolution helper
 Small tool that spins a zero resource process that lowers the timer resolution on windows to the fastest possible.

Example Node.js usage:

```js
const { spawn } = require('child_process');

// Launch the helper process
const helperProcess = spawn('wtrh.exe', {
    detached: false, // Ensures it exits with Node.js
    stdio: 'ignore'  // Prevents output from being tied to Node.js
});

console.log("Windows Timer Resolution Helper started.");

// Optional: Ensure it closes when Node.js exits (undetached process)
process.on('exit', () => {
    console.log("Node.js exiting... Stopping helper.");
    helperProcess.kill(); // Stop the timer helper
});
```
