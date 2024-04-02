# Function that returns the prime numbers from 1 to n
def chus_sieve(n)
  # sieve[i] = number of distinct divisors of i

  # All numbers have at least 2 distinct divisors, 1 and itself
  # Let's pretend 0 and 1 don't exist
  sieve = Array.new(n + 1) { 2 }

  sqrt_n = Math.sqrt(n).to_i
  for i in 2..sqrt_n
    next if sieve[i] != 2

    multiple = i << 1
    while multiple < n + 1
      puts "i: #{i} multiple: #{multiple}"
      sieve[multiple] += 1
      multiple += i
    end
  end

  sieve
end

# Main function in ruby
def main
  n = 100
  sieve = chus_sieve(n)

  puts "Prime numbers from 1 to #{n}:"
  sieve.each_with_index do |divisors, i|
    puts "number: #{i} divisors: #{divisors}"
  end
end

main
