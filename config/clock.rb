# require boot & environment for a Rails app
require_relative "../config/boot"
require_relative "../config/environment"

require 'clockwork'

module Clockwork

  every(2.minutes, 'huge_prime_numbers.job') { HardWorker.perform_async('huge', 10000000) }
  every(10.seconds, 'light_prime_numbers.job') { HardWorker.perform_async('light', 100) }

end