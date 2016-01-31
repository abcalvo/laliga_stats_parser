require 'laliga_stats_parser'
require 'json'

puts Time.new.inspect
puts "Start of parsing..."
data = LaligaStatsParser.scrap_laliga_stats
puts "End of parsing"
puts Time.new.inspect
puts "Start of writing to file..."

File.open("laliga.json", "wb") do |file|
  file << JSON.pretty_generate(data)
end

puts "End of writing to file"
puts Time.new.inspect
