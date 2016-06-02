require 'natto'

str = '隣の客はよく牡蠣食う客だ'

natto = Natto::MeCab.new
natto.parse(str) do |n|
  puts "#{n.surface}\t#{n.feature}" if !n.is_eos?
end
