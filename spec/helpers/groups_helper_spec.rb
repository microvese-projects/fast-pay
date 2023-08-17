require 'rails_helper'

RSpec.describe GroupsHelper, type: :helper do
  describe '#total' do
    it 'calculates the total sum of amounts from dealings' do
      # Create a collection of dummy dealings with different amounts
      dealings = [
        double('Dealing', amount: 10),
        double('Dealing', amount: 20),
        double('Dealing', amount: 30)
      ]

      expect(helper.total(dealings)).to eq(60)
    end

    it 'handles an empty array' do
      expect(helper.total([])).to eq(0)
    end
  end
end
