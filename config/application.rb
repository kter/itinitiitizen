require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    #
    config.hosts << "itinitiitizen.tomohiko.io"
    config.hosts << "itizen.tomohiko.io"
    config.hosts << "itizen.herokuapp.com"
    config.hosts << "itize-publi-1fsihxd1mplba-1940268722.us-east-1.elb.amazonaws.com"
    config.hosts << "localhost"
    config.hosts << "code.tomohiko.io"
    config.hosts << "itizen-staging.herokuapp.com"
  end
end
