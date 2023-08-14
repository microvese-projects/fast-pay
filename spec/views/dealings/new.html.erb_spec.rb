require 'rails_helper'

RSpec.describe "dealings/new", type: :view do
  before(:each) do
    assign(:dealing, Dealing.new(
      name: "MyString",
      amount: 1.5,
      user: nil
    ))
  end

  it "renders new dealing form" do
    render

    assert_select "form[action=?][method=?]", dealings_path, "post" do

      assert_select "input[name=?]", "dealing[name]"

      assert_select "input[name=?]", "dealing[amount]"

      assert_select "input[name=?]", "dealing[user_id]"
    end
  end
end
