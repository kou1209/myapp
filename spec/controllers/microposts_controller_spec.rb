require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do
  describe "#create" do
    # 認証済みのユーザーとして
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end
    end

    # 投稿できること
    it "adds a micropost" do
      project_params = FactoryBot.attributes_for(:micropost)
      expect {
        post:create, params: {micropost: micropost_params}
      }.to change(@user.microposts, :count).by(1)
    end
  end
end
