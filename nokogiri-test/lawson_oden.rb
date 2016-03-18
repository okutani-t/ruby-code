# ここみた http://chuckwebtips.hatenablog.com/entry/2015/12/01/065015

# gemの読み込み
require 'nokogiri'
require 'anemone'

opts = {
  depth_limit: 1
    # 0 => 指定したURL先のみ
    # 1 => 指定したURLにあるlinkから辿れる先も見る。
}

puts "「ローソン」"
Anemone.crawl("http://www.lawson.co.jp/recommend/original/oden/", opts) do |anemone|
  anemone.on_pages_like(/http:\/\/www.lawson.co.jp\/recommend\/original\/oden\//) do |page|
    page.doc.xpath("/html//article[@id='oden']/section[@id='sec-02']/ul/li").each do |node|

      item  = node.xpath("./p[@class='ttl']/text()").to_s
      price = node.xpath("./p[@class='price']/text()").to_s

      puts item + "," + price + "円\n"
    end
  end
end
