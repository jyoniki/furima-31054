## usersテーブル

| Column           | Type   | Options                    |
| ---------------- | ------ | -------------------------- |
| nickname         | string | null:false                 |
| email            | string | null:false,uniqueness:true |
| password         | string | null:false,uniqueness:true |
| first_name       | string | null:false                 |
| last_name        | string | null:false                 |
| first_name_kana  | string | null:false                 |
| last_name_kana   | string | null:false                 |
| birth_day        | date   | null:false                 |

### Association
has_many: items
has_many: purchases


## itemsテーブル
| Column        | Type     | Options                         |
| ------------- | -------- | ------------------------------- |
| user          | referenc | null:false ,foreign_key: true   |
| name          | string   | null:false                      |
| image         | text     | null:false                      | 
| category      | string   | null:false                      | 
| condition     | string   | null:false                      | 
| postage_payes | string   | null:false                      | 
| prefecture    | string   | null:false                      | 
| handling_tims | string   | null:false                      | 
| prics         | string   | null:false                      |
| image         | string   | null:false                      |
| item          | referenc | null:false ,foreign_key: true   |
 
### Association
has_one: purchases
belongs_to: users


## purchasesテーブル
| Column | Type       |Options                       |
| ------ | ---------- | ---------------------------- |
| item   | references | null:false,foreign_key: true |
| user   | references | null:false,foreign_key: true |

### Association
belongs_to: users
belongs_to: items
has_one: addresses


## addressesテーブル
| Column        |Type      |Options                       |
| ------------- | -------- | ---------------------------- |
| post_code     | string   | null:false                   |
| prefectures   | integer  | null:false,foreign_key: true |
| city          | string   | null:false                   |
| building_name | string   |                              |
| phone_number  | string   | null:false,uniqueness:trus   |
| purchase      | referenc | null:false,foreign_key: true |

### Association
belongs_to: purchases