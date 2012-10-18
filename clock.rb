require 'clockwork'
require 'sidekiq'

include Clockwork

class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    puts "#{name}'s doing hard work."
  end
end


every(10.seconds, 'frequent.job') { HardWorker.perform_async('bob', 5) }
