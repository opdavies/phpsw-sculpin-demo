_default:
  just --list

build-css:
  #!/usr/bin/env bash
  args=()

  if [[ "${NODE_ENV:-}" == "production" ]]; then
    args=(--minify)
  else
    args=(--watch)
  fi

  npx tailwindcss \
    --config assets/tailwind.config.ts \
    --output source/build/tailwind.css "${args[@]}"

clean:
  rm -fr output_*/ source/build/

generate *args:
  #!/usr/bin/env bash
  args=()

  if [[ "${APP_ENV:-}" == "production" ]]; then
    args=(--env="prod")
  else
    args=(--server --watch)
  fi

  ./vendor/bin/sculpin generate "${args[@]}" {{ args }}

start *args:
  just generate {{ args }} \
    & just build-css \
    & wait
