require 'rails_helper'

describe SessionsController, type: :controller do
  describe '#new' do
    before :each do
      session[:user_id] = 1
    end
    it 'redirects to the root path' do
      get :new
      expect(response).to redirect_to(root_path)
    end
  end

  describe '#create' do
    let(:action) { post :create, params: { name: 'Foo', password: '1234' } }
    before :each do
      session[:user_id] = 1
    end
    it 'redirects to the root path' do
      action
      expect(response).to redirect_to(root_path)
    end
  end

  describe '#destroy' do
    before :each do
      session[:user_id] = nil
    end
    it 'redirects to the login path' do
      delete :destroy
      expect(response).to redirect_to(login_path)
    end
  end
end
