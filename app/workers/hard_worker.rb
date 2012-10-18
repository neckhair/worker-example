class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    primes = []

    i = 0
    while i < count
      primes << i if isPrime(i)
      i += 1
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