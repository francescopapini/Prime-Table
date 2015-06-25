class PrimeNumber

  # check if a number is prime
  def self.is_prime?(number)
    for denominator in 2..(number - 1)
      if (number % denominator) == 0 
        return false 
      end
    end 
    return true
  end

  # generates the following prime number to be added in the prime numbers array
  def self.next_prime_number(number)
    prime_number = number + 1 
    until is_prime?(prime_number) do
      prime_number += 1
    end
    return prime_number
  end

  # generates prime numbers array (first row of the table)
  def self.create_prime_numbers_array(amount)
    @prime_array = []
    prime_number = 1
    until @prime_array.size == amount do
      prime_number = self.next_prime_number(prime_number)
      @prime_array << prime_number
    end
    return @prime_array
  end

  # generates the rows after the first one 
  def self.create_row(prime_number, prime_array)
    array_row = [prime_number]
    prime_array.each do |pn|
      new_number = (prime_number * pn)
      array_row << new_number
    end
    return array_row
  end

  # generates the table with the specific style
  def self.create_table(prime_array)
    rows = []
    header = [''] + prime_array
    rows << header
    prime_array.each do |prime_number|
     rows << create_row(prime_number, prime_array)
   end
   table = Terminal::Table.new :title => "Prime Numbers", :rows => rows
   return table
  end
  
end