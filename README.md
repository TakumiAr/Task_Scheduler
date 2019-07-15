**User**モデルで管理するテーブル
```
  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text  "email"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end
  ```

  **Task**モデルで管理するテーブル
  ```
    create_table "pictures", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "status"
    t.string "label"
    t.date "deadline"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end
  ```