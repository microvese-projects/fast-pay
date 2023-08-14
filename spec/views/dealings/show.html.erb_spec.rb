require 'rails_helper'

RSpec.describe 'dealings/show', type: :view do
  before(:each) do
    assign(:dealing, Dealing.create!(
                       name: 'Name',
                       amount: 2.5,
                       user: nil
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
  end
end
