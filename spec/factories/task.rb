# 「FactoryBotを使用します」という記述
FactoryBot.define do

    # 作成するテストデータの名前を「task」とします
    # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
    factory :task, class: Task do
        title { "1月1日" }
        content { "最初のコンテンツ" }
        #created_at { "2019-01-01 19:13:53 +0900" }
    end
  
    # 作成するテストデータの名前を「second_task」とします
    # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
    factory :second_task, class: Task do
        title { "1月2日" }
        content { "2番目のコンテンツ" }
        #created_at { "2019-01-02 19:13:53 +0900" }
    end

    factory :third_task, class: Task do
        title { "1月3日" }
        content { "3番目のコンテンツ" }
        #created_at { "2019-01-03 19:13:53 +0900" }
    end
end