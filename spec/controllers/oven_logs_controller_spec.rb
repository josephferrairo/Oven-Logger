require 'rails_helper'

RSpec.describe OvenLogsController, type: :controller do
  login_admin
  describe 'GET #index' do
    it "returns a successful http status code" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    login_admin
    it "returns a successful http status code" do
      oven_log = Fabricate(:oven_log)

      get :show, id: oven_log.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "get #new" do
    login_admin
    it "returns a successful http status code" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    login_admin
    context "a successful create" do
      it "saves the new customer object" do

        post :create, oven_log: Fabricate.attributes_for(:oven_log)
        expect(OvenLog.count).to eq(1)
      end
    end
  end

end
