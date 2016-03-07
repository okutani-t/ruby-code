# coding: utf-8

require 'rubygems'
require 'dbi'

db = DBI.connect('DBI:SQLite3:wnjpn.db')

db.select_all('SELECT * FROM word') do |line|
  puts "line = #{line[4]}"
  break
end

db.disconnect
