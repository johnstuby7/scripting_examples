require 'httparty'
require 'nokogiri'
require 'json'
require 'csv'

page = HTTParty.get('https://www.hostelworld.com/findabed.php/ChosenCity.Calgary/ChosenCountry.Canada')
nokogiri_page = Nokogiri::HTML(page)

puts nokogiri_page.css('span.price')

prices_array = []

nokogiri_page.css('span.price').each do |price|
  price = price.text.delete('$, ')
  prices_array.push(price.to_i)
end

print prices_array

prices_array.delete(0)
prices_array = prices_array.select.with_index { |_, i| i.odd? }
print prices_array

CSV.open('calgary.csv', 'w') do |csv|
  csv << prices_array
end


