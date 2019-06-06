require 'rails_helper'

RSpec.describe User, type: :model do
  # 名前、メール、パスワードがあれば有効な状態であること
  it "is valid with a name, email, and password" do
    user = User.new(
      name: "中野こうすけ",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    expect(user).to be_valid
  end

  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    user = User.create(
      name: "Joe",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    user = User.new(
      name: "Jane",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
end
