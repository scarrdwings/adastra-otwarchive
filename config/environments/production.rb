Otwarchive::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb
  config.hosts.clear

  # The production environment is meant for finished, "live" apps.
  # Code is not reloaded between requests
  config.cache_classes = true
  config.eager_load = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.action_mailer.perform_caching     = true

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile"

  # For nginx:
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

  # If you have no front-end server that supports something like X-Sendfile,
  # just comment this out and Rails will serve the files

  # Disable IP spoofing protection
  config.action_dispatch.ip_spoofing_check = false

  # See everything in the log (default is now :debug)
  # config.log_level = :debug
  config.log_level = :info

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  config.cache_store = :mem_cache_store, ArchiveConfig.MEMCACHED_SERVERS,
                       { namespace: "ao3-v2", compress: true, pool_size: 10 }

  # Disable Rails's static asset server
  # In production, Apache or nginx will already do this
  config.serve_static_files = true

  # Enable serving of images, stylesheets, and javascripts from an asset server
  #config.action_controller.asset_host = ENV[ASSET_HOST].empty? ? 'http://' + Rails::Server.new.options[:Host] + ':' + Rails::Server.new.options[:Port] : ENV[ASSET_HOST]

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  config.middleware.use Rack::Attack
end
