require 'nokogiri'
require 'open-uri'

document = open('https://london.craigslist.co.uk/d/software-qa-dba-etc/search/sof')
content = document.read
parsed_content = Nokogiri::HTML(content)
parsed_content.css('.content').css('.result-info').css('.result-title.hdrlnk')

# use .first to return first element from this content and then call methods on it

parsed_content.css('.content').css('.result-info').css('.result-title.hdrlnk').first.class.instance_methods.sort

# use .class and .instance_methods to sort XML methods for this element

nokogiri_array = parsed_content.css('.content').css('.result-info')

# access timestamp for each advert

timestamp = parsed_content.css('.content').css('.result-info').css('.result-date').first.attributes["datetime"].value


nokogiri_array.each do |row|
  puts "#{row.css('.result-title.hdrlnk').first.inner_text} @ #{row.css('.result-date').first.attributes["datetime"].value}"
end
