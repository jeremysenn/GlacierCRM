Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '409945628802.apps.googleusercontent.com', 'E-AuTCHiVk722pqpXSMd4_QF', {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
    redirect_uri:'http://localhost/auth/google_oauth2/callback'
  }
end