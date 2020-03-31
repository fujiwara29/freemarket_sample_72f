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
- has_many :items
- has_many :comments
- has_many :comments, through: :item
- has_many :orders
- has_many :orders, through: :item
- has_one :profile
- hes_one :address
- has_one :credit_card

---

## profilesテーブル(プロフィール)

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| profile | text       |                                |
| avatar  | string     |                                |
| user_id | references | null :false, foreign_key :true |
|         |            |                                |

### Association

- has_one :user

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

- has_one :user
- has_many :orders

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

- has_one :user

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
- has_many :comments, through: :user
- has_many :images
- has_many :categorys
- belongs_to :brand
- has_many :orders
- has_many :orders, through: :user

---

## imagesテーブル（商品画像専用）

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null :false                    |
| item_id         | reference  | null :false, foreign_key :true |
|                 |            |                                |

### Association
- belongs_to :item

---

## categorysテーブル（カテゴリー用）

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| name    | string    | null :false                    |
| item_id | reference | null :false, foreign_key :true |
|         |           |                                |

### Association
- belongs_to :item

---

## brandsテーブル（ブランド用）

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null :false                    |
| item_id         | reference  | null :false, foreign_key :true |
|                 |            |                                |

### Association
- belongs_to :item

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
- belongs_to :item

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
- belongs_to :item
