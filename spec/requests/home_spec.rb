require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /root" do
    before { get '/' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'main_page' template" do
      expect(response).to render_template('index')
    end
    it 'have the right text' do
      expect(response.body).to include('Budgetfy')
    end
  end
end
