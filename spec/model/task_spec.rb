require 'rails_helper'

RSpec.describe Task, type: :model do

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(title: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(title: '失敗テスト', content: '')
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(title: '成功テスト', content: '成功テスト')
    expect(task).to be_valid
  end

  describe "scope" do
    describe "search_status" do
      let!(:second_task) { create(:second_task) }
      subject { Task.search_status(["status", "未着手"]) }
      it { is_expected.to include second_task }
    end
  end

  describe "scope" do
    describe "search_title" do
      let!(:second_task) { create(:second_task) }
      subject { Task.search_title("スク2") }
      it { is_expected.to include second_task }
    end
  end
end