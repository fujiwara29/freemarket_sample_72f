# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create( nickname:"ニックネーム", email:"email@TEST", password:"12345678", first_name:"鈴木", family_name:"田中", first_name_kana:"スズキ", family_name_kana:"タナカ", birth_year:"2020", birth_month:"1", birth_day:"2", phone_number:"07012345678" )
user.save!

category = Category.create(name:"レディース" )
category.save!

# lady = Category.create(:name=>"レディース")

# lady_tops = lady.children.create(:name=>"トップス")
# lady_jacket = lady.children.create(:name=>"ジャケット/アウター")

# lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
# lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])
