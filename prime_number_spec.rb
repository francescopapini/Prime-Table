require_relative 'prime_number'
require 'terminal-table'


context "prime numbers" do
  it "checks if a number is prime" do
    expect(PrimeNumber.is_prime?(5)).to be true
    expect(PrimeNumber.is_prime?(3)).to be true
    expect(PrimeNumber.is_prime?(24)).to be false
    expect(PrimeNumber.is_prime?(9)).to be false
  end

  it "checks that the next number added to the array is prime" do
    expect(PrimeNumber.is_prime?(PrimeNumber.next_prime_number(5))).to be true
    expect(PrimeNumber.is_prime?(PrimeNumber.next_prime_number(11))).to be true
    expect(PrimeNumber.is_prime?(PrimeNumber.next_prime_number(22))).to be true
    expect(PrimeNumber.is_prime?(PrimeNumber.next_prime_number(14))).to be true
  end 
end

context "table creation" do
  it "creates a first row in the table with prime numbers" do
    prime_array = PrimeNumber.create_prime_numbers_array(4)

    expect(prime_array.size).to eq 4
    expect(PrimeNumber.is_prime?(prime_array[0])).to be true
    expect(PrimeNumber.is_prime?(prime_array[1])).to be true
    expect(PrimeNumber.is_prime?(prime_array[2])).to be true
    expect(PrimeNumber.is_prime?(prime_array[3])).to be true
  end

  it "creates a row after the first one for a specific prime number" do
    prime_array = PrimeNumber.create_prime_numbers_array(4)
    array_row1 = PrimeNumber.create_row(2, prime_array)
    array_row2 = PrimeNumber.create_row(7, prime_array)

    expect(array_row1.size).to eq 5
    expect(array_row1).to eq [2, 4, 6, 10, 14]
    expect(array_row2.size).to eq 5 
    expect(array_row2).to eq [7, 14, 21, 35, 49]
  end

  it "creates a table with the right amount of rows" do
    prime_array1 = PrimeNumber.create_prime_numbers_array(4)
    prime_array2 = PrimeNumber.create_prime_numbers_array(8)
    table1 = PrimeNumber.create_table(prime_array1)
    table2 = PrimeNumber.create_table(prime_array2)

    expect(table1.rows.size).to eq 5
    expect(table2.rows.size).to eq 9
  end

end
