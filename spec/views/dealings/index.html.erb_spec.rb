require 'rails_helper'

RSpec.describe 'dealings/index', type: :view do
  before(:each) do
    assign(:dealings, [
             Dealing.create!(
               name: 'Name',
               amount: 2.5,
               user: nil
             ),
             Dealing.create!(
               name: 'Name',
               amount: 2.5,
               user: nil
             )
           ])
  end

  it 'renders a list of dealings' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
