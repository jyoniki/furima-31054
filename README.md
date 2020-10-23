## usersテーブル

| Column                    | Type   | Options                    |
| ------------------------- | ------ | -------------------------- |
| nickname                  | string | null:false                 |
| email                     | string | null:false,uniqueness:true |
| encrypted_password        | string | null:false,uniqueness:true |
| first_name                | string | null:false                 |
| last_name                 | string | null:false                 |
| first_name_kana           | string | null:false                 |
| last_name_kana            | string | null:false                 |
| birth_day                 | date   | null:false                 |

### Association
has_many: items
has_many: purchases


## itemsテーブル
| Column           | Type        | Options                         |
| -----------------| ----------- | ------------------------------- |
| item_name        | string      | null:false                      |
| description_item | text        | null:false
| category_id      | integer     | null:false                      | 
| condition_id     | integer     | null:false                      | 
| postage_payes_id | integer     | null:false                      | 
| prefecture_id    | integer     | null:false                      | 
| handling_tims_id | integer     | null:false                      | 
| pric             | integer     | null:false                      |
| user             | references  | null:false                      |

### Association
has_one: purchase
belongs_to: user


## purchasesテーブル
| Column | Type       |Options                       |
| ------ | ---------- | ---------------------------- |
| item   | references | null:false,foreign_key: true |
| user   | references | null:false,foreign_key: true |

### Association
belongs_to: user
belongs_to: item
has_one: address


## addressesテーブル
| Column         |Type        |Options                       |
| -------------- | ---------- | ---------------------------- |
| post_code      | string     | null:false                   |
| prefectures_id | integer    | null:false                   |
| city           | string     | null:false                   |
| house_number   | string     | null:false                   |
| building_name  | string     |                              |
| phone_number   | string     | null:false,uniqueness:trus   |
| purchase       | references | null:false                   |

### Association
belongs_to: purchase