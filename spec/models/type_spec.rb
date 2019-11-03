# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Type, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:type) { Type.new(name: 'Purchase') }

  it 'has a name and can be changed' do
    expect(type.name).to eq('Purchase')
    type.name = 'Transfer'
    expect(type.name).to_not eq('Purchase')
  end

  it { should have_many(:expenses).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
end
