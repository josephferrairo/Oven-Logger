require 'rails_helper'

RSpec.describe OvenLogsController, type: :controller do
  describe 'GET #index' do
    it "returns a successful http status code" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns a successful http status code" do
      oven_log = Fabricate(:oven_log)

      get :show, id: oven_log.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "get #new" do

    it "returns a successful http status code" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
