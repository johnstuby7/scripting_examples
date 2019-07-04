require 'mechanize'
require 'json'

mechanize = Mechanize.new

page = mechanize.get('https://en.wikipedia.org/wiki/Main_Page')

page.links.each do |link|
    puts link.href
end

puts 'Link Count: ' 
puts page.links.length

json = JSON.pretty_generate(page.links.length)
File.open("linkInfo.json", 'w') { |file| file.write(json) }
