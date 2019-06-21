require 'rails_helper'

RSpec.describe Micropost, type: :model do
  # 投稿文があれば有効な状態であること
  it "is valid content" do
    micropost = FactoryBot.create(:micropost)
    expect(micropost).to be_valid
  end
end
