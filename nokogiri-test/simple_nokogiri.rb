require 'bundler'
Bundler.require
# require 'nokogiri'

html = <<"EOS"
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hello ruby</title>
</head>
<body>
  <h1>Hello ruby from nokogiri</h1>
</body>
</html>
EOS

doc = Nokogiri::HTML(html)

p "title: " + doc.title
p "h1: " + doc.css('h1').inner_text
