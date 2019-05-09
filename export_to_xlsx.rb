array = File.readlines('data.csv')
count = ARGV[0].to_i
column_count = ARGV[1].to_i
row_count = ARGV[2].to_i
count.times do |iteration|
  ids = (0..array.count - 1).to_a.sort do
    rand() - 0.5
  end[0..column_count * row_count]
  puts ids.join(',')
end

