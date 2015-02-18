require 'rubygems'
require 'json'


new_file = File.read("nfl_ytviews-2-4.txt")
new_stat = JSON.parse(new_file)


new_stat.each do |new_one|

  File.open("nfl_ytviewsJSON.txt", "r+") do |f|
    og_file = f.read
    old_stat = JSON.parse(og_file)

    old_stat.each do |old_one|
      if old_one["title"]  == new_one["title"]
        puts "#{old_one["title"]}"
      else
        puts "No match"
      end
    end
  end
end
