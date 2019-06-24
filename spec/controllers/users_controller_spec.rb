require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#new" do
    # 正常にレスポンスを返すこと
    it "responds successfully" do
      get :new
      expect(response).to be_succes
    end

    # 200レスポンスを返すこと
    it "returns a 200 response" do
      get :new
      expect(response).to have_http_status "200"
    end
  end
end
