# README

## usersテーブル

| Column           | Type    | Options                   |
| ---------------- | ------- | ------------------------- |
| nickname         | string  | null: false               |
| email            | string  | null: false, unique: true |
| password         | string  | null: false               |
| first_name       | string  | null: false               |
| family_name      | string  | null: false               |
| first_name_kana  | string  | null: false               |
| family_name_kana | string  | null: false               |
| birth_year       | date    | null: false               |
| birth_month      | date    | null: false               |
| birth_day        | date    | null: false               |
| phone_number     | integer | null: false, unique: true |
|                  |         |                           |

### Association

- has_many :items
- has_many :comments
- has_many :orders
- has_one :profile
- has_one :address
- has_one :credit_card

---

## profilesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| profile | text       |                                |
| avatar  | string     |                                |
| user_id | references | null: false, foreign_key: true |
|         |            |                                |

### Association

- belongs_to: user

---

## addressesテーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| post_code                    | integer(7) | nul  :false                    |
| prefecture_code              | integer    | nul  :false                    |
| city                         | string     | nul  :false                    |
| house_number                 | string     | nul  :false                    |
| building_name                | string     |                                |
| user_id                      | references | null: false, foreign_ke  :true |
|                              |            |                                |

### Association

- belongs_to :user
- has_many :orders

---

## credit_cardテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false, unique: true      |
| expiration_year  | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |
|                  |            |                                |

### Association

- belongs_to :user

---

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image_id        | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| category_id     | references | null: false, foreign_key: true |
| brand_id        | references | foreign_key: true              |
| condition       | string     | null: false                    |
| postage_payer   | string     | null: false                    |
| prefecture_code | integer    | null: false                    |
| preparation_day | references | null: false                    |
| price           | integer    | null: false                    |
| trading         | string     | null: false                    |
|                 |            |                                |

### Association

- belongs_to :user
- has_many :comments
- has_many :images
- belongs_to :category
- belongs_to :brand
- has_many :orders

---

## imagesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| item_id         | references | null: false, foreign_key: true |
|                 |            |                                |

### Association
- belongs_to :item

---

## categorテーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| name    | string    | null: false                    |
|         |           |                                |

### Association
- has_many :items

---

## brandsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
|                 |            |                                |

### Association
- belongs_to :item

---

## ordersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |
|            |            |                                |

### Association

- belongs_to :user
- belongs_to :item

---

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false,foreign_key: true  |
| comment | text       | null: false                    |
|         |            |                                |

### Association

- belongs_to :user
- belongs_to :item