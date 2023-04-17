Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    hash = JSON.parse(Aws::SecretsManager::Client.new(region: 'ap-northeast-1').get_secret_value(secret_id: ENV["SECRET_ID"]).secret_string)
    
    provider(
      :cognito_idp,
      hash['COGNITO_CLIENT_ID'],
      hash['COGNITO_CLIENT_SECRET'],
      client_options: {
        site: hash['COGNITO_USER_POOL_SITE']
      },
      scope: 'email openid',
      user_pool_id: hash['COGNITO_USER_POOL_ID'],
      aws_region: 'ap-northeast-1'
    )
  else
    provider(
      :cognito_idp,
      ENV.fetch('COGNITO_CLIENT_ID', nil),
      ENV.fetch('COGNITO_CLIENT_SECRET', nil),
      client_options: {
        site: ENV.fetch('COGNITO_USER_POOL_SITE', nil)
      },
      scope: 'email openid',
      user_pool_id: ENV.fetch('COGNITO_USER_POOL_ID', nil),
      aws_region: 'ap-northeast-1'
    )
  end
end
