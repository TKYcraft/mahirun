Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid,
    'app-dev-client',
    'dBHQ3V8kBSsEHzNBvjloPfLYZZgJxi4A',   # keycloak credential
    client_options: {
      base_url: '',
      site: 'http://localhost:8080',
      realm: 'app-dev'
    }, name: 'keycloak'
end
