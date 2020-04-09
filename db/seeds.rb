# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(nickname:"ニックネーム", email:"email@TEST", password:"12345678", first_name:"鈴木", family_name:"田中", first_name_kana:"スズキ", family_name_kana:"タナカ", birth_year:"2020", birth_month:"1", birth_day:"2", phone_number:"07012345678" )
user.save!

category = Category.create(name:"レディース" )
category.save!

# lady = Category.create(name: "レディース")
# # レディースの子カテゴリ
# lady_tops = lady.children.create(name: "トップス")
# lady_jacket = lady.children.create(name: "ジャケット/アウター")
# lady_pants = lady.children.create(name: "パンツ")
# lady_skirt = lady.children.create(name: "スカート")
# lady_onepiece = lady.children.create(name: "ワンピース")
# lady_other = lady.children.create(name: "その他")
# # レディースの孫カテゴリ
# lady_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"}, {name: "シャツ/ブラウス(半袖/袖なし)"}, {name: "シャツ/ブラウス(七分/長袖)"}, {name: "ポロシャツ"}, {name: "キャミソール"}, {name: "タンクトップ"}, {name: "ホルターネック"}, {name: "ニット/セーター"}, {name: "チュニック"}, {name: "カーディガン/ボレロ"}, {name: "アンサンブル"}, {name: "ベスト/ジレ"}, {name: "パーカー"}, {name: "トレーナー/スウェット"}, {name: "ベアトップ/チューブトップ"}, {name: "ジャージ"}, {name: "その他"}])
# lady_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"}, {name: "レザージャケット"}, {name: "ダウンジャケット"}, {name: "ライダースジャケット"}, {name: "ミリタリージャケット"}, {name: "ダウンベスト"}, {name: "ジャンパー/ブルゾン"}, {name: "ポンチョ"}, {name: "ロングコート"}, {name: "トレンチコート"}, {name: "ダッフルコート"}, {name: "ピーコート"}, {name: "チェスターコート"}, {name: "モッズコート"}, {name: "スタジャン"}, {name: "毛皮/ファーコート"}, {name: "スプリングコート"}, {name: "スカジャン"}, {name: "その他"}])
# lady_pants.children.create([{name: "デニム/ジーンズ"}, {name: "ショートパンツ"}, {name: "カジュアルパンツ"}, {name: "ハーフパンツ"}, {name: "チノパン"}, {name: "ワークパンツ/カーゴパンツ"}, {name: "クロップドパンツ"}, {name: "サロペット/オーバーオール"}, {name: "オールインワン"}, {name: "サルエルパンツ"}, {name: "ガウチョパンツ"}, {name: "その他"}])
# lady_skirt.children.create([{name: "ミニスカート"}, {name: "ひざ丈スカート"}, {name: "ロングスカート"}, {name: "キュロット"}, {name: "その他"}])
# lady_onepiece.children.create([{name: "ミニワンピース"}, {name: "ひざ丈ワンピース"}, {name: "ロングワンピース"}, {name: "その他"}])
# lady_other.children.create([{name: "スカートスーツ上下"}, {name: "パンツスーツ上下"}, {name: "ドレス"}, {name: "パーティーバッグ"}, {name: "シューズ"}, {name: "ウェディング"}])

item = Item.create(user_id: "1", name: "商品名", introduction: "商品説明", category_id: "1", brand_id: "", condition: "新品、未使用", postage_payer: "送料込み(出品者負担)", prefecture_code: "東京都", preparation_day: "1~2日で発送", price: "999", trading: "販売中" ) 
item.save!

imege = Image.create(image: "TEST", item_id: "1")
imege.save!