require 'rails_helper'

RSpec.describe 'Splashes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'shows login button' do
      get '/'
      expect(response.body).to include('Log In')
      expect(response.body).to include('Sign Up')
    end
  end
end
