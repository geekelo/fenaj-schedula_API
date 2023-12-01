if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_fenaj-schedula', domain: '*'

else
  Rails.application.config.session_store :cookie_store, key: '_fenaj-schedula'
end
