# PhoenixContained

This repo is designed to server as a reference for getting an Elixir/Phoenix app running inside a dev container

## Prerequisites
- VS Code
- Docker

## Run
- Everything in the `.devcontainer/` directory is needed for configuration
- Open the repository in VS Code. You should be prompted to "Reopen in Container". Otherwise, open the command palette (`cmd` + `shift` + `p`) and look for `Dev Containers: Build and Reopen in Container`
- VS code will build containers and reopen.
- The `postAttachCommand` from `devcontainer.json` should run `mix ecto.setup && mix phx.server`
- Open your local browser to `localhost:4000` to see the app running!

## Development
Develop entirely inside the container! Including running terminal commands like `mix ecto.gen.migration`, etc.
