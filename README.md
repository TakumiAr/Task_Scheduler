**User**モデルで管理するテーブル
```
  create_table "users", force: :cascade do |t|
    t.string "username"
<<<<<<< HEAD
    t.text  "email"
=======
    t.text "email"
>>>>>>> 621d7f4df1f81a21dfb8a80f9b15c741609aaba7
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end
<<<<<<< HEAD
  ```

  **Task**モデルで管理するテーブル
  ```
    create_table "pictures", force: :cascade do |t|
    t.string "title"
=======
```

**Task**モデルで管理するテーブル
```
  create_table "tasks", force: :cascade do |t|
>>>>>>> 621d7f4df1f81a21dfb8a80f9b15c741609aaba7
    t.text "content"
    t.string "status"
    t.string "label"
    t.date "deadline"
<<<<<<< HEAD
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end
  ```
=======
    t.integer "priority"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasts_on_user_id"
  end
```
>>>>>>> 621d7f4df1f81a21dfb8a80f9b15c741609aaba7
