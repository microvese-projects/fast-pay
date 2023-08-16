require 'rails_helper'

RSpec.describe '/dealings', type: :request do
  let(:user) { create(:user) }

  before do
    user.save
    sign_in user
    @group = FactoryBot.create(:group, user: user)
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_user_group_dealing_path(user, @group)
      expect(response).to be_successful
      expect(response.body).to include('Create Dealing')
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Dealing' do
        expect do
          post user_group_dealings_path(user, @group), params: { dealing: {name: 'test', amount: 20} }
        end.to change(Dealing, :count).by(1)
      end

      it 'redirects to the created dealing' do
        post user_group_dealings_path(user, @group), params: { dealing: {name: 'test', amount: 20} }
        expect(response).to redirect_to(user_group_path(user, @group))
      end
    end
    
    context 'with invalid parameters' do
      it 'does not create a new Dealing' do
        expect do
          post user_group_dealings_path(user, @group), params: { dealing: {name: nil, amount: 20} }
        end.to change(Dealing, :count).by(0)
      end
      
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post user_group_dealings_path(user, @group), params: { dealing: {name: nil, amount: 20} }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested dealing' do
  #     dealing = Dealing.create! valid_attributes
  #     expect do
  #       delete dealing_url(dealing)
  #     end.to change(Dealing, :count).by(-1)
  #   end

  #   it 'redirects to the dealings list' do
  #     dealing = Dealing.create! valid_attributes
  #     delete dealing_url(dealing)
  #     expect(response).to redirect_to(dealings_url)
  #   end
  # end
end
