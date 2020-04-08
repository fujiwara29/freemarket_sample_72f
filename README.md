# README

## usersテーブル
| Type    | Column             | Options                               |
| ------- | ------------------ | ------------------------------------- |
| string  | nickname           | null: false                           |
| string  | email              | null: false, unique:true, default: "" |
| string  | encrypted_password | null: false,              default: "" |
| string  | first_name         | null: false                           |
| string  | family_name        | null: false                           |
| string  | first_name_kana    | null: false                           |
| string  | family_name_kana   | null: false                           |
| integer | birth_year         | null: false                           |
| integer | birth_month        | null: false                           |
| integer | birth_day          | null: false                           |
| string  | phone_number       | null: false, unique:true              |
|         |                    |                                       |

### Association
- has_many: items
- has_many: comments
- has_many: orders
- has_one: profile
- has_one: address
- has_one: credit_card

---

## profilesテーブル
| Type       | Column  | Options     |
| ---------- | ------- | ----------- |
| text       | profile |             |
| string     | avatar  |             |
| references | user    | null: false |
|            |         |             |

### Association
- belongs_to: user

---

## addressesテーブル
| Type       | Column                       | Options     |
| ---------- | ---------------------------- | ----------- |
| integer(7) | post_code                    | nul  :false |
| integer    | prefecture_code              | nul  :false |
| string     | city                         | nul  :false |
| string     | house_number                 | nul  :false |
| string     | building_name                |             |
| references | user                         | null: false |
|            |                              |             |

### Association
- belongs_to: user
- has_many: orders

---

## credit_cardテーブル
| Type       | Column           | Options                        |
| ---------- | ---------------- | ------------------------------ |
| integer    | card_number      | null: false, unique: true      |
| integer    | expiration_year  | null: false                    |
| integer    | expiration_month | null: false                    |
| integer    | security_code    | null: false                    |
| references | user             | null: false                    |
|            |                  |                                |

### Association
- belongs_to: user

---

## itemsテーブル
| Type       | Column          | Options     |
| ---------- | --------------- | ----------- |
| references | user            | null: false |
| string     | name            | null: false |
| text       | introduction    | null: false |
| references | category        | null: false |
| references | brand           |             |
| string     | condition       | null: false |
| string     | postage_payer   | null: false |
| string     | prefecture_code | null: false |
| string     | preparation_day | null: false |
| integer    | price           | null: false |
| string     | trading         | null: false |
|            |                 |             |

### Association
- belongs_to: user
- has_many: comments
- has_many: images
- belongs_to: category
- belongs_to: brand
- has_many: orders

---

## imagesテーブル
| Type       | Column | Options     |
| ---------- | ------ | ----------- |
| string     | image  | null: false |
| references | item   | null: false |
|            |        |             |

### Association
- belongs_to: item

---

## categoriesテーブル
| Type   | Column | Options     |
| ------ | ------ | ----------- |
| string | name   | null: false |
|        |        |             |

### Association
- has_many: items

---

## brandsテーブル
| Type   | Column | Options     |
| ------ | ------ | ----------- |
| string | name   | null: false |
|        |        |             |

### Association
- belongs_to: item

---

## ordersテーブル
| Type       | Column  | Options     |
| ---------- | ------- | ----------- |
| references | user    | null: false |
| references | item    | null: false |
| references | address | null: false |

### Association
- belongs_to: user
- belongs_to: item

---

## commentsテーブル
| Type       | Column  | Options     |
| ---------- | ------- | ----------- |
| references | user    | null: false |
| references | item    | null: false |
| text       | comment | null: false |
|            |         |             |

### Association
- belongs_to: user
- belongs_to: item