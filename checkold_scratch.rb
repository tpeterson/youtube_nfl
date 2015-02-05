require 'rubygems'
require 'json'


new_file = File.read("nfl_ytviews-2-4.txt")
new_stat = JSON.parse(new_file)

i = 0

while i < new_stat.length

  File.open("nfl_ytviewsJSON.txt", "r+") do |f|
    og_file = f.read
    old_stat = JSON.parse(og_file)
    j = 0

    while j < old_stat.length
      if old_stat[j]["title"] == new_stat[i]["title"]
        puts "#{old_stat[j]["title"]}"
        j += 1
      else
        j += 1
      end
    end
  end

  i += 1
end
