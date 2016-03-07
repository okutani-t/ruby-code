# coding: utf-8
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./exdata.db"
)

Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

class Exdatas < ActiveRecord::Base
end
#Exdatas.find(1).delete
#p Exdatas.all
lat = 35.70398
lon = 139.546046
puts "地域,名詞,動詞を入力してください"
input = gets
input.chomp!
datas = input.split("、")
p datas[0] + datas[1] + datas[2]
Exdatas.create(area: datas[0],
              noun: datas[1],
              verb: datas[2],
              lat: lat,
              lon: lon)
p Exdatas.all
