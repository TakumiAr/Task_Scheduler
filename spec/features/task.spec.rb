require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する

    # backgroundの中に記載された記述は、そのカテゴリ内（feature "タスク管理機能", type: :feature do から endまでの内部）
    # に存在する全ての処理内（scenario内）で実行される
    # （「タスク一覧のテスト」でも「タスクが作成日時の降順に並んでいるかのテスト」でも、background内のコードが実行される）
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:third_task)
  end

  scenario "タスク一覧のテスト" do
    visit tasks_path
  
    expect(page).to have_content 'タスク1, 終了期限1'
    expect(page).to have_content '最初のコンテンツ'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in "task_title", with: "てすとーーー"
    fill_in "task_content", with: "てすつ"

    click_on "登録する"
    expect(page).to have_content 'てすとーーー'
    expect(page).to have_content 'てすつ'
  end

  scenario "タスク詳細のテスト" do

    visit tasks_path

    first(".show").click

    expect(page).to have_content 'タスク2, 終了期限3'
    expect(page).to have_content '2番目のコンテンツ'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    expect(all('.Task_content')[0]).to have_content 'タスク3, 終了期限2'
    expect(all('.Task_content')[2]).to have_content 'タスク1, 終了期限1'
  end

  scenario "タスク一覧が狩猟期限でソートができるかのテスト" do
    visit tasks_path
    expect(all('.Task_content')[0]).to have_content 'タスク3, 終了期限2'
    expect(all('.Task_content')[2]).to have_content 'タスク1, 終了期限1'
  end
end