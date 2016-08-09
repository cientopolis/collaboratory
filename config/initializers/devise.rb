Devise.setup do |config|
  config.mailer_sender = 'no-reply@zooniverse.org'

  require 'devise/orm/active_record'

  config.authentication_keys = [ :login ]
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.password_length = 4..128
  config.reset_password_within = 6.hours
  config.paranoid = true
  config.sign_out_via = :delete
  config.secret_key = '1f8a402265703da9ee4d25f04fce0c4ced5c584decaa2460eb799336c30a4427a52c02ea550ba1bd5105440805cb08ba62bad620b18811c3dd049136896ac830'

  # MAILER
  require 'devise_mailer/background_mailer'
  config.mailer = "Devise::BackgroundMailer"

  # OMNIAUTH

  def load_social_config
    config = YAML.load(ERB.new(File.read(Rails.root.join('config/social.yml'))).result)
    config[Rails.env].symbolize_keys
  end

  def social_config
    @social_config ||= load_social_config
  end

  def omniauth_config_for(config, providers: provider)
    providers.each do |provider|
      conf = social_config[provider].symbolize_keys
      config.omniauth provider, conf.delete(:app_id), conf.delete(:app_secret), **conf
    end
  end

  omniauth_config_for(config, providers: [:facebook, :gplus])
end
