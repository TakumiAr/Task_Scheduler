# 「FactoryBotを使用します」という記述
FactoryBot.define do

    # 作成するテストデータの名前を「task」とします
    # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
    factory :task, class: Task do
        title { "タスク1, 終了期限1" }
        content { "最初のコンテンツ" }
        deadline { "2020-03-10 "}
        #created_at { "2019-01-01 19:13:53 +0900" }
    end
  
    # 作成するテストデータの名前を「second_task」とします
    # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
    factory :second_task, class: Task do
        title { "タスク2, 終了期限3" }
        content { "2番目のコンテンツ" }
        deadline { "2020-03-30 "}
        #created_at { "2019-01-02 19:13:53 +0900" }
    end

    factory :third_task, class: Task do
        title { "タスク3, 終了期限2" }
        content { "3番目のコンテンツ" }
        deadline { "2020-03-20 "}
        #created_at { "2019-01-03 19:13:53 +0900" }
    end
end