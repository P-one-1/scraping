require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
# doc = Nokogiri::HTML(URI.open('https://nokogiri.org/tutorials/installing_nokogiri.html'))
doc = Nokogiri::HTML(URI.open('https://www.celebritynetworth.com/list/top-100-richest-people-in-the-world/'))

# Search for nodes by css
# doc.css('nav ul.menu li a', 'article h2').each do |link|  # For 'https://nokogiri.org/tutorials/installing_nokogiri.html'
# doc.css('div.number','div.summary h2', 'div.net_worth').each do |link|
#   puts link.content
# end

# Search for nodes by xpath
# doc.xpath('//nav//ul//li/a', '//article//h2').each do |link|
#   puts link.content
# end

# Or mix and match
# doc.search('nav ul.menu li a', '//article//h2').each do |link|
#   puts link.content
# end

# Search for nodes by .search()
billionaires = doc.search('a.anchor.clearfix')
billionaires.each do |bill|
  # puts bill
  name = bill.search('h2.title').text.gsub('Net Worth', '')
  net_worth = bill.search('div.net_worth').text
  bio = bill.search('div.bio').text
  rank = bill.search('div.number').text
  puts "Name: #{name}, Rank: #{rank}, Net Worth: #{net_worth}"
  puts bio
end