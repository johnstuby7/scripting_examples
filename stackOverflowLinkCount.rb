require 'mechanize'

mechanize = Mechanize.new

page = mechanize.get('https://stackoverflow.com')

page.links.each do |link|
    puts link.href
end

puts 'Link Count: '
puts page.links.length

