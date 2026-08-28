# Task 2: Automate Local Gitea Project Setup

## Objective

The objective of this task was to automate the process of building and running the Gitea project locally using a shell script without Docker.

## Environment

- Operating System: Windows
- Terminal: MSYS2 UCRT64
- Shell: Bash

## Implementation

Created a shell script named:

```text
setup.sh
```

The script performs the following tasks:

- Checks required tools: Git, Go, Node.js, pnpm, Make, and curl.
- Displays dependency versions.
- Verifies that it is running from the Gitea project root directory.
- Builds Gitea using `make build`.
- Verifies that the Gitea binary was created.
- Checks whether port `3000` is available.
- Starts the Gitea web server.
- Displays the URL:

```text
http://localhost:3000
```

## How to Run

Make the script executable:

```bash
chmod +x setup.sh
```

Run the script:

```bash
./setup.sh
```

## Testing

The script was tested successfully. Gitea was built and started automatically, and the application was verified in the browser at:

```text
http://localhost:3000
```

## Issues Faced

- MSYS2 displayed repeated `shared_info::initialize` warnings, but they did not affect the application.
- An existing Gitea server needed to be stopped before testing the script again because port `3000` was already in use.

## What I Learned

This task helped me understand Bash scripting, automation, dependency checks, error handling, building Gitea from source, port checking, and automating the local application startup process.

## GitHub

The Task 2 work was completed on the:

```text
gitea-task-2
```

branch and will be raised as a Pull Request to:

```text
gitea-task-2 → main
```

in my own GitHub repository.

## Status

Task 2 automation and testing completed successfully.
