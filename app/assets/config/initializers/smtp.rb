ActionMailer::Base.smtp_settings = {
  address: Rails.application.credentials.dig(:smtp, :address),
  port: 587,
  user_name: Rails.application.credentials.dig(:smtp, :user),
  password: Rails.application.credentials.dig(:smtp, :password),
  authentication: :login,
  enable_starttls_auto: true,
}
