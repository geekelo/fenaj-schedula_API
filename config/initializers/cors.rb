# frozen_string_literal: true
# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

# config/initializers/cors.rb

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins 'https://fenaj-schedula.onrender.com' # Add your frontend origin(s)

#     resource '/api/*',
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head],
#       credentials: true
#   end
# end


Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3000'
  
      resource '*',
               headers: :any,
               methods: %i[get post patch put delete]
    end
  end
