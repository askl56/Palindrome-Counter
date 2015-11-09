require 'counter'

describe 'Counter' do

  subject(:counter) { Counter.new }

  it "outputs the 'File checked' output" do
    expect { subject.call }.to output(/File checked: test_files\/another-test.txt/).to_stdout
  end

  it 'outputs the "Range" to output' do
    expect { subject.call }.to output(/Range: 1..100/).to_stdout
  end

  it 'outputs the palindrome count to output' do
    expect { subject.call }.to output(/Palindromes: 18/).to_stdout
  end

  it 'outputs the new line separator to output' do
    expect { subject.call }.to output(/\========================/).to_stdout
  end
end
