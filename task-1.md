\# Task 1 - Gitea Local Setup \& Understanding



\## Gitea



Gitea is a self-hosted, all-in-one software development platform that provides Git hosting, code review, issue tracking, project management, collaboration, package registry, and CI/CD support.



Written in Go, Gitea is lightweight and runs across major platforms such as Linux, macOS, FreeBSD, OpenBSD, and Windows, supporting multiple architectures.



\## Task Objective



The main objective was to set up Gitea locally, understand the project structure and documentation, run it without Docker, and verify that it was working correctly.



\## Repository Setup



\- Forked the official Gitea repository to my GitHub account.

\- Cloned the repository to my local system.

\- Added `origin` for my GitHub fork and `upstream` for the official Gitea repository.

\- Created the `gitea-task-1` branch for the task work.



Some important parts of the repository that were reviewed:



\- `cmd/` - application commands

\- `models/` - database models

\- `routers/` - application routes

\- `services/` - service logic

\- `web\_src/` - frontend source

\- `templates/` - UI templates

\- `tests/` - test files

\- `main.go` - application entry point

\- `go.mod` - Go module configuration

\- `Makefile` - build commands



\## Project Understanding



Reviewed the main project documentation:



\- `README.md`

\- `CONTRIBUTING.md`

\- `docs/build-setup.md`

\- `docs/development.md`



\## Environment Setup



The required development tools were installed and verified:



```text

Git       2.55.0

Go        1.27.0

Node.js   24.15.0

npm       11.12.1

pnpm      11.22.1

Make      4.4.1

```



The required Go version and pnpm version were checked from the project configuration.



\## Build and Run



Gitea was built from source using:



```bash

make build

```



After the build completed successfully, Gitea was started without Docker using:



```bash

./gitea web

```



The application started successfully on:



```text

http://localhost:3000

```



The Initial Configuration page was verified in the browser.



\## Issues Faced



\- Some tools were available in Git Bash but not initially in the MSYS2 UCRT64 environment.

\- PATH configuration was adjusted to access Go, Node.js, npm, pnpm, and Make.

\- `pnpm` was not initially available and was installed with the project-required version.

\- Git LFS was initially unavailable and required separate setup.

\- The `shared\_info::initialize` MSYS2 warnings appeared repeatedly but did not affect the setup.

\- The Gitea repository path in MSYS2 differed from the normal Windows path, which caused some initial confusion while locating files.

\- The Gitea application was successfully built and started after resolving the environment issues.



\## Documentation



The Task 1 setup details, issues, learning, and screenshots were documented separately.



Detailed document:



```text

Task1 doc/Task Document 1.pdf

```



\## GitHub and Pull Request



The completed Task 1 work was committed to the `gitea-task-1` branch and pushed to my GitHub fork.



The task branch was prepared for a Pull Request into the `main` branch of my own repository:



```text

gitea-task-1 → main

```



\## What I Learned



This task helped me understand the Gitea project structure, documentation, Git fork and branch workflow, environment setup, building and running Gitea locally without Docker, troubleshooting setup issues, and verifying the application in the browser.



\## Status



Task 1 local setup, verification, documentation, GitHub push, and Pull Request preparation completed successfully.



