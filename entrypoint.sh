#!/bin/bash
set -e

echo "Running database migrations..."
bundle exec rails db:migrate

echo "Precompiling assets..."
bundle exec rails assets:precompile

exec "$@"