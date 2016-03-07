# coding: utf-8
require 'net/http'
require 'uri'

def p_or_n(str)
  res =  Net::HTTP.post_form(URI.parse('http://mueki.net/twana/api.php'),{'q'=>str})
  return res.body
end

print "肯定or否定測定>"
while str = gets
  puts p_or_n(str)
  print "肯定or否定測定>"
end
