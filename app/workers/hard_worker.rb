

module Workers

  class HardWorker
    include Sidekiq::Worker

    def perform(name, count)
      puts "#{name}'s doing hard work."
    end
  end

end