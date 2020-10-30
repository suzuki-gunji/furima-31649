## usersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| email      | string     | null: false, unique:true       |
| password   | string     | null: false                    |
| nickname   | string     | null: false                    |
| last_name  | text       | null: false                    |
| first_name | text       | null: false                    |
| birthday   | string     | null: false                    |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_name  | text       | null: false                    |
| category   | text       | null: false                    |
| price      | string     | null: false                    |
| user       | references | null: false  foreign_key: true |

### Association
- has_one :purchases
- has_many :addresses
- belongs_to :users

## purchasesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| day        | string     | null: false                    |
| user       | references | null: false  foreign_key: true |
| item       | references | null: false  foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items

## addressesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | text       | null: false                    |
| building     | text       | null: false                    |
| phone number | integer    | null: false                    |


### Association
- belongs_to :items
