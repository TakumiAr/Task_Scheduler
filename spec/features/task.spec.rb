require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  scenario "タスク一覧のテスト" do
    Task.create!(title: 'test_task_01', content: 'testtesttest')
    Task.create!(title: 'test_task_02', content: 'samplesample')
  
    visit tasks_path
  
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
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
    Task.create!(title: 'てすとーーー', content: 'てすつ')
  
    visit tasks_path
  
    first("table").click_link "詳細を確認する"

    expect(page).to have_content 'てすとーーー'
    expect(page).to have_content 'てすつ'

  end
end