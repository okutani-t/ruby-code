require 'bundler'
Bundler.require

# @see https://github.com/mobmewireless/origami-pdf

reader = Origami::PDF.read('test.pdf')

puts reader.pages.first.Contents.data

# とても大変そうだからここまで...
