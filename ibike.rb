#!/usr/bin/env ruby
# encoding: utf-8
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

ibikeLocation = {
	"北區行政大樓" => {"lat" => "24.165899", "lng" => "120.682366"},
	"博館育德路口" => {"lat" => "24.1574614", "lng" => "120.6691935"},
	"國立自然科學博物館" => {"lat" => "24.157246", "lng" => "120.666135"},
	"太原北中清路口" => {"lat" => "24.165132", "lng" => "120.673279"},
	"學士育德路口" => {"lat" => "24.157811", "lng" => "120.681172"},
	"臺中公園" => {"lat" => "24.142539", "lng" => "120.684291"},
	"臺中孔廟" => {"lat" => "24.153300", "lng" => "120.689310"},
	"英士公園" => {"lat" => "24.151175", "lng" => "120.675549"},
	"五權西文心路口" => {"lat" => "24.139906", "lng" => "120.646912"},
	"公益大英街口" => {"lat" => "24.150745", "lng" => "120.648530"},
	"文心森林公園" => {"lat" => "24.146776", "lng" => "120.646350"},
	"BRT中正國小" => {"lat" => "24.152514", "lng" => "120.666314"},
	"BRT科博館/金典酒店" => {"lat" => "24.155495", "lng" => "120.663068"},
	"BRT茄苳腳" => {"lat" => "24.150021", "lng" => "120.671245"},
	"中山地政事務所" => {"lat" => "24.136550", "lng" => "120.673675"},
	"公益公園" => {"lat" => "24.151321", "lng" => "120.657661"},
	"國立臺灣美術館" => {"lat" => "24.141031", "lng" => "120.661843"},
	"大墩文化中心" => {"lat" => "24.141207", "lng" => "120.666615"},
	"市民廣場" => {"lat" => "24.150774", "lng" => "120.663024"},
	"臺中州廳" => {"lat" => "24.138219", "lng" => "120.678683"},
	"臺中教育大學" => {"lat" => "24.145197", "lng" => "120.671138"},
	"萬壽棒球場" => {"lat" => "24.146560", "lng" => "120.650585"},
	"BRT新光/遠百" => {"lat" => "24.165977", "lng" => "120.643178"},
	"BRT頂何厝" => {"lat" => "24.159105", "lng" => "120.655826"},
	"大隆東興路口" => {"lat" => "24.155732", "lng" => "120.654054"},
	"市政府(文心樓)" => {"lat" => "24.161428", "lng" => "120.648693"},
	"漢翔福星北路口" => {"lat" => "24.185216", "lng" => "120.644315"},
	"福星公園" => {"lat" => "24.172492", "lng" => "120.648127"},
	"秋紅谷" => {"lat" => "24.168062", "lng" => "120.638990"},
	"逢甲大學" => {"lat" => "24.178721", "lng" => "120.645043"},
	"重慶公園" => {"lat" => "24.165904", "lng" => "120.655539"}
}

#指定工作目錄
dir_path = "."
puts "chdir #{dir_path}"
Dir.chdir(dir_path)

contents = doc.xpath("//div[@id='content_page']//div[@id='stationList']//table//tbody//tr")
bikeArray = []
contents.each do |content|
	#system("wget -P #{name} #{img}")
	xml_doc = Nokogiri.XML("#{content}", nil, 'UTF-8')
<<<<<<< HEAD
	
	sarea = "#{xml_doc.xpath("//td[1]")[0].text}"
	sna = "#{xml_doc.xpath("//td[2]")[0].text}"
	sbi = "#{xml_doc.xpath("//td[3]//p")[0].text}"
	bemp = "#{xml_doc.xpath("//td[3]//p")[1].text}"
	posStation = ibikeLocation["#{sna}"]	

	puts "區域:#{sarea} \n"
	puts "站名:#{sna} \n"
	puts "可借車輛:#{sbi} \n"
	puts "可停車輛:#{bemp} \n"
	puts "北緯:#{posStation["lat"]} \n"
	puts "東經:#{posStation["lng"]} \n"
	puts "------------------#{DateTime.now.strftime('%Y/%m/%d %I:%M%p')}------------------------- \n"
	
	tempHash = {
		"sarea" => "#{sarea}",
		"sna" => "#{sna}",
		"sbi" => "#{sbi}",
		"bemp" => "#{bemp}",
		"lat" => "#{posStation["lat"]}",
		"lng" => "#{posStation["lng"]}",
		"update" => "#{DateTime.now.strftime('%Y/%m/%d %I:%M%p')}"
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
