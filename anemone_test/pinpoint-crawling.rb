# amazonから取得
require 'bundler'
require 'kconv'
Bundler.require

# オプション
opts = { :delay => 0.5 }

# クロールの起点となるURLを指定
# books => 本, bestsellers => kindle
urls = []
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466298/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466282/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/")

Anemone.crawl(urls, :depth_limit => 0) do |anemone|
  anemone.on_every_page do |page|
    # 文字コードをUTF-8にした上で、Nokogiriでパース
    doc = Nokogiri::HTML.parse(page.body.toutf8)

    category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text

    # カテゴリ名の表示
    sub_category = doc.xpath("//*[@id=\"zg_listTitle\"]/span").text

    puts category + "/" + sub_category

    # 一般・kindleストア有料
    items = doc.xpath("//div[@class=\"zg_itemRow\"]/div[1]/div[2]")
    # kindle無料
    items += doc.xpath("//div[@class=\"zg_itemRow\"]/div[2]/div[2]")

    items.each{|item|
      # 順位
      puts item.xpath("div[1]/span[@class=\"zg_rankNumber\"]").text
      # 書名
      puts item.xpath("div[\"zg_title\"]/a").text

      # ASIN
      puts item.xpath("div[\"zg_title\"]/a").attribute("href")
        .text.match(%r{dp/(.+?)/})[1]
    }
  end
end
