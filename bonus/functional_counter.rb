open_file         = -> (path) { File.open(path) { |file| { path: path, range: file.read.split(/\n/)} } }
to_range          = -> (data) { data[:range] = Range.new(data[:range].first.to_i, data[:range].last.to_i); data }
count_palindromes = -> (data) { data[:count] = data[:range].select { |number| number.to_s == number.to_s.reverse }.length; data }

data = Dir['test_files/*.txt'].map(&open_file)
                   .map(&to_range)
                   .map(&count_palindromes)

data.each do |element|
  puts "File checked: #{element[:path]}"
  puts "Range: #{element[:range]}"
  puts "Palindromes: #{element[:count]}"
  puts '========================'
  puts
end
