require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'json'

file = File.read("nfl_ytviewsJSON.txt")

stat = JSON.parse(file)

i = 0

while (i < stat.length)
  if stat[i]["views"] == "1,945,923 views"
    puts stat[i]["title"]
    i += 1
  else
    i += 1
  end
end
