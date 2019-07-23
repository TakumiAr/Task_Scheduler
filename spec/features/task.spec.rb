require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  before do
    @user = User.create(name: "z", email: "a@a.com", password: "11111111", password_confirmation: "11111111")
  end
  
  background do
    # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する

    # backgroundの中に記載された記述は、そのカテゴリ内（feature "タスク管理機能", type: :feature do から endまでの内部）
    # に存在する全ての処理内（scenario内）で実行される
    # （「タスク一覧のテスト」でも「タスクが作成日時の降順に並んでいるかのテスト」でも、background内のコードが実行される）
    # FactoryBot.create(:task)
    # FactoryBot.create(:second_task)
    # FactoryBot.create(:third_task)

    def sign_in
      visit new_session_path
      fill_in "Email", with: "a@a.com"
      fill_in "Password", with: "11111111"
      click_on "Log in"
      Task.create(title: 'aaa', content: 'bbb', deadline: '2020-03-10', status: '着手中', priority: 0, user_id: @user.id )
      Task.create(title: 'ccc', content: 'ddd', deadline: '2021-03-10', status: '未着手', priority: 1, user_id: @user.id )
    end

  end

  scenario "タスク一覧のテスト" do
    sign_in
    visit tasks_path
    expect(page).to have_content 'aaa'
  end

  scenario "タスク作成のテスト" do
    sign_in
    visit new_task_path
    fill_in "Title", with: "lll"
    fill_in "Content", with: "eee"
    fill_in "Deadline", with: "2019-10-10"
    click_on "a"
    expect(page).to have_content '低'
    expect(page).to have_content '未着手'
  end

#   scenario "タスク詳細のテスト" do

#     visit tasks_path

#     find("詳細").click
#     save_and_open_page
#     expect(page).to have_content '着手中'
#   end

#   scenario "タスクが作成日時の降順に並んでいるかのテスト" do
#     visit tasks_path
#     expect(all('.Task_content')[0]).to have_content 'タスク3, 終了期限2'
#     expect(all('.Task_content')[2]).to have_content 'タスク1, 終了期限1'
#   end

#   scenario "タスク一覧が終了期限でソートができるかのテスト" do
#     visit tasks_path(sort_expired: "true")
#     expect(all('.Task_content')[0]).to have_content 'タスク2, 終了期限3'
#     expect(all('.Task_content')[2]).to have_content 'タスク1, 終了期限1'
#   end

#   scenario "タスク一覧が優先順位でソートができるかのテスト" do
#     visit tasks_path(sort_priority: "true")
#     expect(all('.Task_content')[0]).to have_content 'タスク1, 終了期限1'
#     expect(all('.Task_content')[2]).to have_content 'タスク2, 終了期限3'
#   end
end