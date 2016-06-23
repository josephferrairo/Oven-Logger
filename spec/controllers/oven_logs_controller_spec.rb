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

  describe "POST #create" do

    context "a successful create" do
      it "saves the new customer object" do
        post :create, oven_log: Fabricate.attributes_for(:oven_log)
        expect(OvenLog.count).to eq(1)
      end
    end
  end

  describe "put #update" do
    context "successful update" do
      let ( :abc) {Fabricate(:oven_log, customer: "ABC")}
      it "updates the modified oven log object" do

        put :update, oven_log: Fabricate.attributes_for(:oven_log, customer: "XYZ"), id: abc.id

        expect(OvenLog.last.customer).to eq("XYZ")
        expect(OvenLog.last.customer).not_to eq("ABC")
      end
    end
  end

  describe "GET #edit" do
    let(:oven_log) { Fabricate(:oven_log) }

    it "sends a successful edit request" do
      get :edit, id: oven_log

      expect(response).to have_http_status(:success)
    end
  end

  describe "delete #destroy" do
    let(:oven_log) { Fabricate(:oven_log) }

    it "deletes the oven log with the given id" do
      delete :destroy, id: oven_log.id

      expect(OvenLog.count).to eq(0)
    end
  end

end
