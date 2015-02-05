require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'json'


URL_FILE = "nfl_ytviews.txt"
ytvids = []

url = 'https://www.youtube.com/channel/UCDVYQ4Zhbm3S2dlz7P1GBDg/videos'

page = Nokogiri::HTML(open(url))

page.css('ul#browse-items-primary li .yt-lockup-content').each do |video|
  headline = video.css('.yt-lockup-title a')
  title = headline.inner_html
  url = video.at_css('.yt-lockup-title')
  get_link = url.xpath('a/@href')
  link = "http://www.youtube.com" + get_link.to_s
  viewcount = video.css('.yt-lockup-meta .yt-lockup-meta-info li:nth-child(1)')
  views = viewcount.inner_html
  uploaded = video.css('.yt-lockup-meta .yt-lockup-meta-info li:nth-child(2)')
  upload_date = uploaded.inner_html
  date = Time.now

  ytvids.push(
    title: title,
    views: views,
    link: link,
    upload_date: upload_date,
    date: date
  )
end

ytvids.each do |video|
  file = File.open(URL_FILE, "r") { |file| file.read }
  stats = JSON.parse(file)
  check_views(stats)

  def check_views(stats)
    puts JSON.pretty_generate(stats)
    
  end

  File.read(URL_FILE) do |x|
    x = ytvids
    if (x.views == ) do

    end
  end
end


File.open(URL_FILE, 'w') do |f|
  f.puts ytvids
end
