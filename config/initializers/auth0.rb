Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'g69ZVOAZvHFl5zNWGyjyOthItRUluqUP',
    Rails.application.secrets.auth0secret,
    'kaiba.auth0.com',
    callback_path: '/auth/oauth2/callback',
    authorize_params: {
      scope: 'openid profile',
      audience: 'https://kaiba.auth0.com/userinfo'
    }
  )
end
