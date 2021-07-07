# アプリ名
request-app

# 概要
　経費申請をするのが面倒、特に購入経緯をいちいち上司に説明するのが面倒だという人が多かった事から、カンタンな経費申請アプリを作成しました。部下が経費申請を作成し、上司は承認・却下を選ぶ事ができます。購入経緯の確認は確認チャットルームを作成することができ、メッセージ投稿、画像投稿を通して購入経緯を説明・確認することが出来ます。

# 制作背景（意図）
　面倒な経費申請をよりカンタンに、より明確にしたいという気持ちから、見やすくて申請が楽な経費申請アプリを作成しました。不動産の案内前に、急遽吹き抜けの高い所の掃除をしなければならなくなった為、近くのホームセンターで掃除用具を購入した。ニオイ対策が必要になり急遽購入した。など、部下の立場から考えて急遽必要になった経費は上司に説明するのが少し大変で持ち出しになってしまうような事があるものを、カンタンに申請できるような設計にしました。上司の立場から考えて明らかに私的な物を購入しているものは却下できるようにもなっています。さらに、判断が微妙なものに関しては確認チャットルームを用意し、チャットで購入経緯を確認できる機能があると便利だと考え作成しました。

# ＤＥＭＯ
以下、実装予定内容を含む。

### INDEXページ
[![INDEXページ](https://i.gyazo.com/c0ee13dc90be88a8077c862190322d94.png)](https://gyazo.com/c0ee13dc90be88a8077c862190322d94)

■新規登録、ログインを選べる。これ以上すすむにはどちらかが必須になっている。


### 新規登録ページ
[![新規登録](https://i.gyazo.com/f5400722620e72e876a0120d051deab2.gif)](https://gyazo.com/f5400722620e72e876a0120d051deab2)

■氏名を入力後、アクティブハッシュで役職と部署を選んでとパスワードを入力して登録できる。


### ログインページ
[![ログイン画面](https://i.gyazo.com/e28be671864a9e9f3c8198fd30a5fe04.png)](https://gyazo.com/e28be671864a9e9f3c8198fd30a5fe04)

■アドレスとパスワードを入力してログインできる。

### TOP画面(非役職者)
![TOP画面](https://i.gyazo.com/1421241914ed99637917749d4e9a1158.png)](https://gyazo.com/1421241914ed99637917749d4e9a1158)

■TOPページ
ログインに成功するとこのページに遷移する。
申請から申請する事ができ、自分の投稿には編集と取消することが出来る

### TOP画面(役職者)
![TOP画面](https://i.gyazo.com/6253b6d93f0d5920bf18c33ad91da566.png)](https://gyazo.com/6253b6d93f0d5920bf18c33ad91da566)

■TOPページ
ログインに成功するとこのページに遷移する。役職者のみ詳細、承認、却下することが出来る。

### 承認ページ(役職者)
![承認ページ(役職者)](https://i.gyazo.com/116cc27909806ab3c6f463dc7bcb30d9.gif)](https://gyazo.com/116cc27909806ab3c6f463dc7bcb30d9)

■承認ページ(役職者)役職者が承認するとこのページに遷移する。


### CHAT画面
![CHAT画面](https://i.gyazo.com/80b1f9b1c809dbd2e1be7f28ac97778f.gif)](https://gyazo.com/80b1f9b1c809dbd2e1be7f28ac97778f)

■ルームごとのチャット画面表示
画面上部のフォームからチャットルームを作成でき、コメントや画像を投稿できる。


# 課題 / 今後実装したい機能
- 承認一覧から個別の写真を検索し、合計金額を自動計算されるようなシステム
- 商品詳細からチャットルームにいけるようなシステム
- 単体テストだけではなく、複合テストの導入
- 社員の社員番号と写真をわかりやすく表示する


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
