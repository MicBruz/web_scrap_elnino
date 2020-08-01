require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = "https://www.elnino-parfum.pl/perfumy/?c=459&sort=price_desc&page=1"
  unparsed_page = HTTParty.get(url) # we get raw HTML of that page
  parsed_page = Nokogiri::HTML(unparsed_page) # we parse it to a format we can extract from it

  nr_per_sex = parsed_page.css('span.Filter-linkCount') #ilość w filtrach np 1330
  meskie = nr_per_sex[0].children[0].text.slice(30,4)
  damskie = nr_per_sex[1].children[0].text.slice(30,4)
  unisex = nr_per_sex[2].children[0].text.slice(30,3)



  puts "Męskie: #{meskie}"
  puts "Damskie: #{damskie}"
  puts "Unisex: #{unisex}"
  # byebug

end


scraper
