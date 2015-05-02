Rails.application.configure do
  config.cache_store = :dalli_store,
                    (ENV["MEMCACHIER_SERVERS"] || "").split(","),
                    {:username => ENV["MEMCACHIER_USERNAME"],
                     :password => ENV["MEMCACHIER_PASSWORD"],
                     :failover => true,
                     :socket_timeout => 1.5,
                     :socket_failure_delay => 0.2
                    }

  # Settings specified here will take precedence over those in config/application.rb.
  config.serve_static_files = true

  config.eager_load = true

  config.log_level = :info

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # response to: DEPRECATION WARNING: Currently, Active Record
  # suppresses errors raised within `after_rollback`/`after_commit`
  # callbacks and only print them to the logs. In the next version,
  # these errors will no longer be suppressed. Instead, the errors
  # will propagate normally just like in other Active Record callbacks.
  config.active_record.raise_in_transactional_callbacks = true

  config.assets.css_compressor = CSSminify.new
  config.assets.js_compressor = :uglifier
end
