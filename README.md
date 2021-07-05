# テーブル設計

## users テーブル

| Column                     | Type             | Options                        |
| -------------------------- | ---------------- | ------------------------------ |
| email                      | string           | unique: true, null: false      |
| encrypted_password         | string           | null: false                    |
| team_id                    | integer          | null: false                    |
| position_id                | integer          | null: false                    |
| name                       | string           | null: false                    |
| name_kana                  | string           | null: false                    |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- has_many :items
- has_many :approvals
- has_many :disapproval

## items テーブル

| Column                    | Type             | Options                        |
| ------------------------- | ---------------- | ------------------------------ |
| name                      | string           | null: false                    |
| regular                   | string           | null: false                    |
| quantity                  | string           | null: false                    |
| price                     | string           | null: false                    |
| total_price               | string           | null: false                    |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- belongs_to :user
- has_many :approvals
- has_many :disapproval

## rooms テーブル

| Column                    | Type             | Options                        |
| ------------------------- | ---------------- | ------------------------------ |
| name                      | string           | null: false                    |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column                    | Type             | Options                        |
| ------------------------- | ---------------- | ------------------------------ |
| user                      | references       | null: false, foreign_key: true |
| room                      | references       | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column                    | Type             | Options                        |
| ------------------------- | ---------------- | ------------------------------ |
| content                   | string           |                                |
| user                      | references       | null: false, foreign_key: true |
| room                      | references       | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## approvals テーブル

| Column                    | Type             | Options                         |
| ------------------------- | ---------------- | ------------------------------- |
| user                      | references       | null: false,foreign_key: true   |
| item                      | references       | null: false,foreign_key: true   |

### Association
- belongs_to :user
- belongs_to :item

## disapprovals テーブル

| Column                    | Type           | Options                         |
| ------------------------- | -------------- | ------------------------------- |
| user                      | references     | null: false,foreign_key: true   |
| item                      | references     | null: false,foreign_key: true   |

### Association
- belongs_to :user
- belongs_to :item
