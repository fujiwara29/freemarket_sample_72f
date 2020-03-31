# README

## usersテーブル

| Column           | Type    | Options                   |
| ---------------- | ------- | ------------------------- |
| nickname         | string  | null :false               |
| email            | string  | null :false, unique :true |
| password         | string  | null :false               |
| first_name       | string  | null :false               |
| family_name      | string  | null :false               |
| first_name_kana  | string  | null :false               |
| family_name_kana | string  | null :false               |
| birth_year       | date    | null :false               |
| birth_month      | date    | null :false               |
| birth_day        | date    | null :false               |
| phone_number     | integer | null :false, unique :true |
|                  |         |                           |

 Associationas_many :comments
- has_many :comments, through: :items
- has_many :items
- has_many :orders
- has_one :profile
- hes_one :addresses
- has_one :credit_card



#### 備考

new     新規登録
create  会員登録完了ページ
show    マイページ（自分のページにはサイドバーが出現し各種項目編集可能）｛他ユーサーのページはプロフィールと出品一覧表示のみ｝
edit      各ユーザー情報を編集できるようにする
update  
destroy 退会

ユーザー情報の編集について
メルカリの実際のサービスでは
・自己紹介とニックネーム
・姓名、姓名ｶﾅ、郵便番号、都道府県、市区町村、番地、建物名、電話番号
・クレジットカード情報
・メールアドレス、パスワード
・郵便番号、都道府県、市区町村、番地、建物名、電話番号（おそらくユーザー情報とは別にあるので今回は一括にまとめる）
の項目に編集ページが分かれている。

---

## profilesテーブル(プロフィール)

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| profile | text       |                                |
| avatar  | string     |                                |
| user_id | references | null :false, foreign_key :true |
|         |            |                                |

### Association

- belongs_to :user



### 備考   
new     新規登録、リダイレクトでマイページ

destroy 退会

---

## credit_cardテーブル(支払い方法)

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null :false, unique :true      |
| expiration_year  | integer    | null :false                    |
| expiration_month | integer    | null :false                    |
| security_code    | integer    | null :false                    |
| user_id          | references | null :false, foreign_key :true |
|                  |            |                                |

### Association

- belongs_to:user



### 備考
new     新規登録（再登録）
create  登録完了
destroy 情報削除

正しい情報でないと登録できない
マイページから登録をする
マイページから削除できる
マイページから再登録ができる

---

## addressesテーブル(本人情報の登録)

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| post_code                    | integer(7) | null :false                    |
| prefecture_code              | integer    | null :false                    |
| city                         | string     | null :false                    |
| house_number                 | string     | null :false                    |
| building_name                | string     |                                |
| user_id                      | references | null :false, foreign_key :true |
|                              |            |                                |

### Association

- belongs_to :user



### 備考

---

## itemsテーブル（商品関連）

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image_id        | references | null: false ,foreign_key :true |
| name            | string     | null :false                    |
| introduction    | text       | null :false                    |
| category_id     | references | null :false ,foreign_key :true |
| brand_id        | references | foreign_key :true              |
| condition       | string     | null :false                    |
| postage_payer   | string     | null :false                    |
| prefecture_code | integer    | null :false                    |
| preparation_day | references | null :false                    |
| price           | integer    | null :false                    |
| trading         | string     | null :false                    |
|                 |            |                                |

### Association

- belongs_to :user
- has_many :comments
- has_many :images



### 備考
index   TOP 商品一覧は画像、価格、商品名を表示する
new     新規出品フォーム（全てのViewに表示されている）
create  出品完了フォーム
show    個別ページ
edit    編集ページ
update  編集完了ページ
destroy 削除

（追加項目）
items::SearchsController
index   検索結果表示

売り切れ商品がわかるようにする（Tradingで設定）
購入された商品を買えないようにする
出品者が商品を購入できないようにする
出品者のみが編集することができるようにする
編集できる項目（画像、商品名、商品説明、カテゴリー、商品の状態、配送料の負担、配送元地域、発送準備日、販売価格）
編集ページに遷移した際商品情報が表示されているか
何も編集せず完了を押しても画像が消えないか
商品が正常に削除できるか
投稿者のみが削除できるか

確認の際3品以上の商品を出品している状態にしていること
出品内容、販売価格が適切なものであるか（いや～んな感じの名前とか5000兆円とかに設定しない）
既存のサービス名や商品ロゴを使用していないこと
basic認証を実装できている

Basic認証とはWeb上で利用できる認証システムです。
Webサイトを運用したことがある人であれば一度は見たことがあるかもしれません。
Basic認証が設定されているページへアクセスすると、ポップアップが表示されます。
そこに前もって設定してあったIDとpasswordを入力することで、ログインすることができます。
「.htaccess」を利用して、設定できるという非常に簡単な認証機能のため、
セキュリティのレベルとしては非常に低いものになります。
あくまでも取り急ぎの認証であることを忘れないようにしましょう。

---

## imagesテーブル（商品画像専用）

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null :false                    |
| item_id         | reference  | null :false, foreign_key :true |
|                 |            |                                |

### Association
- belongs_to :item



### 備考



---

## categorysテーブル（カテゴリー用）

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| name    | string    | null :false                    |
| item_id | reference | null :false, foreign_key :true |
|         |           |                                |

### Association
- belongs_to :item



### 備考

---

## brandsテーブル（ブランド用）

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null :false                    |
| item_id         | reference  | null :false, foreign_key :true |
|                 |            |                                |

### Association
- belongs_to :item



### 備考



---

## ordersテーブル（商品購入後のやり取り用）

| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| user_id    | reference | null :false, foreign_key :true |
| item_id    | reference | null :false, foreign_key :true |
| address_id | reference | null :false, foreign_key :true |
|            |           |                                |

### Association

- belongs_to :user
- has_many :comments



### 備考
取引中、過去の取引がマイページに表示される
クレジットカード情報がないと購入できない
クレジットカードが登録されていれば購入できる
購入完了したら購入完了ページへ遷移する

---

## commentsテーブル（中間テーブル）（追加実装項目）

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| user_id | reference | null :false, foreign_key :true |
| item_id | reference | null  :false,foreign_key :true |
| comment | text      | null :false                    |
|         |           |                                |

### Association

- belongs_to :user
- has_many :items
