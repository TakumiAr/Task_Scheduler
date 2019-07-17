バージョン情報
```
❯ ruby -v
ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin18]

❯ rails -v
Rails 5.2.3
```

**User**モデルで管理するテーブル
```
  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text "email"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end
```

**Task**モデルで管理するテーブル
```
  create_table "tasks", force: :cascade do |t|
    t.text "content"
    t.string "status"
    t.string "label"
    t.date "deadline"
    t.integer "priority"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasts_on_user_id"
  end
```

---

**Heroku**へのデプロイ方法


git commitコマンドを入力して、コミットをする。
```
$ git add .
$ git commit -m "メッセージ"
```

GitHubのTask_Schedulerレポジトリにpushすれば自動でHerokuにデプロイする設定になっているため、pushする。
```
git push origin master
```
これで完了だが、念の為Herokuアプリを最初から作成する方法も下に記載する。

Herokuにアプリケーションを作成する。(既に作成済み)
```
$ heroku create
```
Herokuにデプロイをする。(GitHubのmasterブランチにpushすれば自動でデプロイされるように設定済み)
```
$ git push heroku master
```

データベースを移行する。
```
$ heroku run rails db:migrate
```

---

