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
| Column        | Type        | Options                         |
| ------------- | ----------- | ------------------------------- |

| category      | integer     | null:false                      | 
| condition     | integer     | null:false                      | 
| postage_payes | integer     | null:false                      | 
| prefecture    | integer     | null:false                      | 
| handling_tims | integer     | null:false                      | 
| prics         | string      | null:false                      |
| item          | references  | null:false                      |
 
### Association
has_one: purchases
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
| post_code_id   | string     | null:false                   |
| prefectures_id | integer    | null:false                   |
| city           | string     | null:false                   |
| building_name  | string     |                              |
| phone_number   | string     | null:false,uniqueness:trus   |
| purchase       | references | null:false,foreign_key: true |

### Association
belongs_to: purchase