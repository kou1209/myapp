require 'rails_helper'

RSpec.describe Micropost, type: :model do
  # 投稿文があれば有効な状態であること
  it "is valid content" do
    micropost = FactoryBot.create(:micropost)
    expect(micropost).to be_valid
  end

  # 投稿文がなければ無効な状態であること
  it "is invalid without a micropost.content" do
    micropost = FactoryBot.build(:micropost, content: nil)
    micropost.valid?
    expect(micropost.errors[:content]).to include("を入力してください")
  end
end
