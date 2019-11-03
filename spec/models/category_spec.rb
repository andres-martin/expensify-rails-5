# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:category) { Category.new(name: 'Groceries') }

  it 'has a name and can be changed' do
    expect(category.name).to eq('Groceries')
    category.name = "Clothing"
    expect(category.name).to eq('Clothing')
  end

  it { should have_many(:expenses).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
end
