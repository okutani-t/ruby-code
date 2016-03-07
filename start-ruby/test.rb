# coding: utf-8

names = ["小林","林","高野","盛岡"]

names.each do |name|
  if /小林/ =~ name
    puts name
  end
end
