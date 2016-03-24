# cookpadから取得
require 'kconv'
require 'bundler'
require 'yaml'
Bundler.require

# オプション
opts = { :delay => 0.5 }

# クロールの起点となるURLを指定
# books => 本, bestsellers => kindle
urls = []
urls.push("http://cookpad.com/recipe/2047371")
urls.push("http://cookpad.com/recipe/2972253")

Anemone.crawl(urls, :depth_limit => 0) do |anemone|
  anemone.on_every_page do |page|
    # 文字コードをUTF-8にした上で、Nokogiriでパース
    doc = Nokogiri::HTML.parse(page.body.toutf8)

    # レシピタイトルの取得
    recipe_title = doc.xpath("//*[@id='recipe-title']/h1").text
    # レシピのステップ取得
    steps = doc.xpath("//div[@id=\"steps\"]/div")
    # メイン画像の取得
    main_img = doc.xpath("//div[@id=\"main-photo\"]/img").attribute("data-large-photo").value

    # textに書き出し
    File.open("cookpad.txt", "a") do |file|
      file.write("【title】: #{recipe_title}".gsub(/(\s)/,"") + "\n")
      file.write("【image path】: #{main_img}".gsub(/(\s)/,"") + "\n")
      steps.each do |step|
        file.write(step.xpath("dl/dd/p").text.chomp)
      end
    end
  end
end
