require 'bundler'
Bundler.require

# @see https://github.com/yob/pdf-reader

reader = PDF::Reader.new('test.pdf') # http://www1.mhlw.go.jp/topics/kenko21_11/pdf/t3.pdf

puts reader.pdf_version
puts reader.info
puts reader.metadata
puts reader.page_count

reader.pages.each do |page|
  puts page.text
end

# 文字化けしまくりだった...
