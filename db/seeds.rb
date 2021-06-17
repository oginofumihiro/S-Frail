# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: 'sfrail@1127.com', password: 'password') # 管理者のメールアドレスとパスワード
Customer.create(email: 'fumi@1127.com', password: 'password') # 会員側のメールアドレスとパスワード
Genre.create(name: '運動')
Genre.create(name: '食事')
Genre.create(name: '会話')
