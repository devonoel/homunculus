require 'rails_helper'

describe NamesController, type: :controller do
  context "when logged in" do
    before :each do
      session[:user_id] = 1
    end
    describe "#index" do
      xit "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "#new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "#create" do
      it "returns http success" do
        post :create
        expect(response).to have_http_status(:success)
      end
    end
  end
end
#
# describe '#new' do
#   before :each do
#     session[:user_id] = 1
#   end
#   it 'redirects to the root path' do
#     get :new
#     expect(response).to redirect_to(root_path)
#   end
# end
#
# describe '#create' do
#   let(:action) { post :create, params: { name: 'Foo', password: '1234' } }
#   before :each do
#     session[:user_id] = 1
#   end
#   it 'redirects to the root path' do
#     action
#     expect(response).to redirect_to(root_path)
#   end
# end
#
# describe '#destroy' do
#   before :each do
#     session[:user_id] = nil
#   end
#   it 'redirects to the login path' do
#     delete :destroy
#     expect(response).to redirect_to(login_path)
#   end
# end
