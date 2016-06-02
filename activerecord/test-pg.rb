require 'active_record'
require 'pg'

# Active Record初期設定
ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:pg)

# DB格納用のクラス
class Cookpad < ActiveRecord::Base
end

Cookpad.create(
  title: '揚げ豆腐',
  contributor: 'oda',
  image: 'agedohu.jpg',
  url: 'http://agedohu.com',
  date: '2016-6',
  description: 'めっちゃおいしい揚げ豆腐です。'
)

def get_data
  cp = Cookpad.order("created_at DESC").limit(10)
  p cp
end

get_data
