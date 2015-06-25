require 'terminal-table'
require_relative 'prime_number'

if ARGV.length != 1
  puts "Please pass one argument!"
else
  amount = ARGV[0].to_i
  prime_array = PrimeNumber.create_prime_numbers_array(amount)
  puts PrimeNumber.create_table(prime_array)
end
