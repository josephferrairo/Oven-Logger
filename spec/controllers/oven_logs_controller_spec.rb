require 'rails_helper'

RSpec.describe OvenLogsController, type: :controller do
  describe 'GET #index' do
    it "returns a successful http status code" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

end
