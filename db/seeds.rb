# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'

#this will store all of the companies scraped with their ticker symbol
companies = []

#get companies list
doc = Nokogiri::HTML(open('http://www.wsj.com/mdc/public/page/2_3021-activnyse-actives.html'))

#iterate through the companies and split stock name and ticker
#append both values (as an array) into the companies array
doc.css('td a.linkb').each do |f|
  full_name = f.text
  name, ticker = full_name.split(' (')
  ret_arr = [name, ticker.chomp().chop()]
  companies << ret_arr
end

#for each company create a value in the stocks database
companies.each do |comp|
  Stock.create(company: comp[0], ticker: comp[1], price: 0, dividend: 0, type: false, rating: "A")
end
