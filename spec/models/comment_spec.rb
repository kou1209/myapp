require 'rails_helper'

RSpec.describe Comment, type: :model do
  # コメントがあれば有効な状態であること
  it "is valid comment" do
    comment = FactoryBot.create(:comment)
    expect(comment).to be_valid
  end

  # コメントがなければ無効な状態であること
  it "is invalid without a comment.content" do
    comment = FactoryBot.build(:comment, content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include("を入力してください")
  end
end
