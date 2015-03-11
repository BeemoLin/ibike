#!/usr/bin/env ruby
## encoding: utf-8
require 'nokogiri'
require 'open-uri'
require 'watir-webdriver'
require 'json'

url = "http://i.youbike.com.tw/cht/f12.php"
browser = Watir::Browser.new
browser.goto url
html = browser.html
browser.close
doc = Nokogiri::HTML("#{html}", nil, 'UTF-8')

#指定工作目錄
dir_path = "."
puts "chdir #{dir_path}"
Dir.chdir(dir_path)

contents = doc.xpath("//div[@id='content_page']//div[@id='stationList']//table//tbody//tr")
bikeArray = []
contents.each do |content|
	#system("wget -P #{name} #{img}")
	xml_doc = Nokogiri.XML("#{content}", nil, 'UTF-8')
	puts "區域:#{xml_doc.xpath("//td[1]")[0].text} \n"
	puts "站名:#{xml_doc.xpath("//td[2]")[0].text} \n"
	puts "可借車輛:#{xml_doc.xpath("//td[3]//p")[0].text} \n"
	puts "可停車輛:#{xml_doc.xpath("//td[3]//p")[1].text} \n"
	puts "------------------#{DateTime.now}------------------------- \n"
	
	tempHash = {
		"sarea" => "#{xml_doc.xpath("//td[1]")[0].text}",
		"sna" => "#{xml_doc.xpath("//td[2]")[0].text}",
		"sbi" => "#{xml_doc.xpath("//td[3]//p")[0].text}",
		"bemp" => "#{xml_doc.xpath("//td[3]//p")[1].text}",
		"update" => "#{DateTime.now}"
	}

	bikeArray.push(tempHash)

end

filePath = '/home/beemolin/backup/ibike/ibike.json'

File.open("#{filePath}","w") do |f|
		f.write("#{bikeArray.to_json}")
		sleep 0.1
end

# BM-2cX7NMFyEtwZZcXybLBRpwK4woUwta6fqs@bitmessage.ch
# godjjinin
