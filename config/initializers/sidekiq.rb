require 'sidetiq/web'

Sidekiq.configure_server do |config|
  Sidetiq::Clock.start!
end
