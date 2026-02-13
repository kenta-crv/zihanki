# Puma can serve each request in a thread from an internal thread pool.
# Low-memory server optimization: reduce thread count.
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 2 }
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests.
port ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
environment ENV.fetch("RAILS_ENV") { "production" }

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# IMPORTANT:
# This server runs multiple Puma apps on 7.5GB RAM.
# To prevent memory bloat, restrict workers to 1.
workers ENV.fetch("WEB_CONCURRENCY") { 1 }

# Preload application for Copy-On-Write memory savings.
preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# Enable control app (required for phased restart etc.)
activate_control_app

# Graceful restart tuning
worker_timeout 60 if ENV.fetch("RAILS_ENV", "production") == "production"

# Optional: Reduce memory fragmentation impact
GC.compact if GC.respond_to?(:compact)
