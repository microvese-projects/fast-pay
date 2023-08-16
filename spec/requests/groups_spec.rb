require 'rails_helper'

RSpec.describe '/groups', type: :request do
  let(:user) { create(:user) }

  let(:valid_attributes) do
    { name: 'Food', icon: 'https://assets.materialup.com/uploads/a4d861ba-07a4-426d-b3cb-67f0353de4e1/preview.jpg', user: }
  end

  let(:invalid_attributes) do
    { name: nil, icon: 'icon.png', user: }
  end

  before do
    user.save
    sign_in user
    @group = FactoryBot.create(:group, user:)
  end

  after do
    Dealing.destroy_all
    Group.destroy_all
    User.destroy_all
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get user_groups_path(user, @group)
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      group = Group.create! valid_attributes
      get user_group_url(user, group)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_user_group_url(user)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Group' do
        expect do
          post user_groups_path(user), params: { group: { name: 'Bills', icon: 'https://assets.materialup.com/uploads/a4d861ba-07a4-426d-b3cb-67f0353de4e1/preview.jpg', user: } }
        end.to change(Group, :count).by(1)
      end

      it 'redirects to the created group' do
        post user_groups_path(user), params: { group: { name: 'Rent', icon: 'https://assets.materialup.com/uploads/a4d861ba-07a4-426d-b3cb-67f0353de4e1/preview.jpg', user: } }
        expect(response).to redirect_to(user_groups_path(user))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Group' do
        expect do
          post user_groups_path(user), params: { group: invalid_attributes }
        end.to change(Group, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post user_groups_path(user), params: { group: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    before { Group.destroy_all }

    it 'destroys the requested group' do
      group = Group.create! valid_attributes
      expect do
        delete user_group_path(user, group)
      end.to change(Group, :count).by(-1)
    end

    it 'redirects to the groups list' do
      group = Group.create! valid_attributes
      delete user_group_path(user, group)
      expect(response).to redirect_to(user_groups_path(user))
    end
  end
end
