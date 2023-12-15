#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install --without production
bundle exec rails assets:clean
bundle exec rails db:migrate