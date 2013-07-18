class HardWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  sidekiq_options unique: :all
  #recurrence { minutely.second_of_minute(15, 45) }

  def perform(name, count)
    puts "#{name} job: Starting to count prime numbers from 0 to #{count}."
    primes = []

    for i in 0..count
      primes << i if isPrime(i)
    end

    puts "#{name} job: From 0 to #{count} there are #{primes.count} prime numbers."
  end

  private

    def isPrime(number)
      if number == 0 or number == 1
        return false
      end

      i = 2
      limit = number / i
      while i < limit
        return false if number % i == 0

        i += 1
        limit = number / i
      end

      return true
    end

end
