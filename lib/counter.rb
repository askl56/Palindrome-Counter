class Counter

  # Public: Read test files and output the number of palindromes found in each
  # test file

  def call
    load_data('test_files/*.txt').each do |data|
      data[:count] = palindrome_count(data[:range])
      output(data)
    end
  end

  private

  # Internal: Build a data structure based on test date on file
  #
  # path - path spec used to load test files
  #
  # Returns: Array of hashes
  # => [ { file: 'test-file1.txt', range: (1..100) }
  #      { file: 'test-file2.txt', range: (400..700) } ]

  def load_data(path)
    Dir[path].map do |file_path|
      range = File.open(file_path) { |file| file.read.split(/\n/) }

      { file: file_path, range: Range.new(*range) }
    end
  end

  # Internal: Count the number of palindromes in the given range
  #
  # range - ruby range object to enumerate
  #
  # Returns: integer

  def palindrome_count(range)
    range.select { |number| number == number.reverse }.size
  end

  # Internal: format the palindrome results data and send to STDOUT
  #
  # results - array of hashes
  #
  # Returns: nothing

  def output(results)
    puts "File checked: #{results[:file]}"
    puts "Range: #{results[:range]}"
    puts "Palindromes: #{results[:count]}"
    puts '========================'
    puts
  end
end

Counter.new.call
