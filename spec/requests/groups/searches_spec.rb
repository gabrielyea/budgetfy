require 'rails_helper'

RSpec.describe "Groups::Searches", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/groups/searches/index"
      expect(response).to have_http_status(:success)
    end
  end

end
