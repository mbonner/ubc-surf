# Be sure to restart your server when you modify this file
require 'yaml'

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
#RAILS_GEM_VERSION = '2.0.2' unless defined? RAILS_GEM_VERSION
#RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

raw_config = File.read(RAILS_ROOT + "/config/config.yml")
APP_CONFIG = YAML.load(raw_config)[RAILS_ENV]

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use (only works if using vendor/rails).
  # To use Rails without a database, you must remove the Active Record framework
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
#  config.action_controller.session = {
#    :session_key => '_www.ubcsurf.com_session',
#    :secret      => 'ad844914d400235eb76241af6a3a619c19ed9b7623c3da1787cac20a478b5e9400ee078ae27c4c0e4530781c6906664970ded8e8336c4b66e702dd425d1296d7'
#  }
  config.action_controller.session = {
    :session_key => APP_CONFIG['settings']['session_key'],
    :secret      => APP_CONFIG['settings']['secret']
  }


  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with 'rake db:sessions:create')
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector
#  config.active_record.observers = :user_observer

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc
end

unless RAILS_ENV == 'production'
  #PAYPAL_ACCOUNT = 'sandboxaccount@example.com'
  # I think this is the accont payment is sent to.
  PAYPAL_ACCOUNT = 'bonner_1218667753_biz@gmail.com'
  ActiveMerchant::Billing::Base.mode = :test
else
  PAYPAL_ACCOUNT = 'paypalaccount@example.com'
end

# not sure at all how this will meld w/ what is in the config.yaml file, or how the contents in there
# is ultimately used.
require 'smtp_tls'

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
#ActionMailer::Base.server_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  #:domain => "localhost.localdomain",
  :domain => "ubcsurf.com",
  :authentication => :plain,
  :user_name => "ubcsurfclub",
  :password => "longbeach"
}
