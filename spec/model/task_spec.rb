require 'rails_helper'

RSpec.describe Task, type: :model do
#   describe '' do
#     context '' do
#       it '' do

#       end
#     end
#   end
# end

  before do
    @user = User.create(name: "z", email: "a@a.com", password: "11111111", password_confirmation: "11111111")
  end

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(title: '', content: '成功テスト', deadline: '2020-03-10', status: '着手中', priority: 0, user_id: @user.id )
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(title: '成功テスト', content: '', deadline: '2020-03-10', status: '着手中', priority: 0, user_id: @user.id )
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(title: '成功テスト', content: '成功テスト', deadline: '2020-03-10', status: '着手中', priority: 0, user_id: @user.id )
    expect(task).to be_valid
  end
  
  # describe "scope" do
  #   describe "search_status" do
  #     @user = User.create(name: "z", email: "a@a.com", password: "11111111", password_confirmation: "11111111")
  #     task = Task.new(title: '成功テスト', content: '成功テスト', deadline: '2020-03-10', status: '未着手', priority: 0, user_id: @user.id )
  #     subject { Task.search_status(["status","未着手"])}
  #     it { is_expected.to include "未着手" }
  #   end
  # end

  it "モデルに作成したscopeを使用し、ステータスによる検索ができる" do
    @task = Task.create(title: '成功テスト', content: '成功テスト', deadline: '2020-03-10', status: '着手中', priority: 0, user_id: @user.id )
    @task.save
    expect_task_status = Task.where(status: '着手中')
    result = Task.search_status(["status", "着手中"])
    expect(expect_task_status[0][:status]).to eq "着手中"
    expect(result[0][:status]).to eq "着手中"
  end

  it "モデルに作成したscopeを使用し、タスク名による検索ができる" do
    @task = Task.create(title: '成功テスト', content: '成功テスト', deadline: '2020-03-10', status: '着手中', priority: 0, user_id: @user.id )
    @task.save
    expect_task_title = Task.where(title: '成功テスト')
    result = Task.search_title("成功テスト")
    expect(expect_task_title[0][:title]).to eq "成功テスト"
    expect(result[0][:title]).to eq "成功テスト"
  end

  # describe "scope" do
  #   describe "search_status" do
  #     
  #     subject { Task.search_status(["status", "未着手"]) }
  #     it { is_expected.to include second_task }
  #   end
  # end

  # describe "scope" do
  #   describe "search_title" do
  #     task = Task.new(title: '成功テスト', content: '成功テスト', deadline: '2020-03-10', status: '未着手', priority: 0, user_id: @user.id )
  #     subject { Task.search_title("") }
  #     it { is_expected.to include second_task }
  #   end
  # end
end