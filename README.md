## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique:true       |
| encrypted_password | string     | null: false                    |
| nickname           | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_reading       | string     | null: false                    |
| first_reading      | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| explain          | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| days_id          | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false  foreign_key: true |

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
| building      | string     |                                |
| phone number  | string     | null: false                    |
| purchase      | references | null: false  foreign_key: true |


### Association
- belongs_to :purchase