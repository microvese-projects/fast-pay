require 'rails_helper'

RSpec.describe 'dealings/edit', type: :view do
  let(:dealing) do
    Dealing.create!(
      name: 'MyString',
      amount: 1.5,
      user: nil
    )
  end

  before(:each) do
    assign(:dealing, dealing)
  end

  it 'renders the edit dealing form' do
    render

    assert_select 'form[action=?][method=?]', dealing_path(dealing), 'post' do
      assert_select 'input[name=?]', 'dealing[name]'

      assert_select 'input[name=?]', 'dealing[amount]'

      assert_select 'input[name=?]', 'dealing[user_id]'
    end
  end
end
