require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
    let(:action) { post :create, params: { name: 'Foo', password: '1234', password_confirmation: '1234' } }
    before :each do
      session[:user_id] = 1
    end
    it 'redirects to the root path' do
      action
      expect(response).to redirect_to(root_path)
    end
  end
end
