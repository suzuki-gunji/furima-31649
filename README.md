## usersテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| email        | string     | null: false, unique:true       |
| password     | string     | null: false                    |
| nickname     | string     | null: false                    |
| last_name    | string     | null: false                    |
| first_name   | string     | null: false                    |
| last_reading | string     | null: false                    |
| first_name   | string     | null: false                    |
| birthday     | string     | null: false                    |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| item_explain  | string     | null: false                    |
| category      | string     | null: false                    |
| item_status   | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| days          | string     | null: false                    |
| price         | string     | null: false                    |
| user          | references | null: false  foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user

## purchasesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false  foreign_key: true |
| item       | references | null: false  foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     | null: false                    |
| phone number  | string     | null: false                    |
| purchase      | references | null: false  foreign_key: true |


### Association
- belongs_to :purchase