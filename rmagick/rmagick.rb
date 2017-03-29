require 'bundler'
Bundler.require

# blur
img = Magick::ImageList.new('sample.jpg')
img.blur_image(20.0, 10.0).write('blur.jpg')

# small
img = Magick::ImageList.new('sample.jpg')
img.scale(0.25).write('small.jpg')
