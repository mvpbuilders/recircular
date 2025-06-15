Rails.application.default_url_options[:host] = "https://www.shopcircu.com"
routes.default_url_options[:host] = "https://www.shopcircu.com"

config.action_mailer.delivery_method = :smtp
config.action_mailer.perform_caching = false
config.action_mailer.asset_host = "https://www.shopcircu.com"
config.action_mailer.default_url_options = { host: "https://www.shopcircu.com" }
