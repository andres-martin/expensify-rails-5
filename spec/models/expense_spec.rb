# == Schema Information
#
# Table name: expenses
#
#  id         :integer          not null, primary key
#  concept    :string
#  amount     :integer
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Expense, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:expense) { Expense.new(concept: 'get my glasses fixed', amount: 30, date: '2019-11-03') }

  it 'has a concept' do
    expect(expense.concept).to eq('get my glasses fixed')
  end

  it 'has an amount' do
    expect(expense.amount).to eq(30)
    expense.amount = 50
    expect(expense.amount).to eq(50)
  end
  
  it 'has a date' do
    expect(expense.date.to_s).to eq('2019-11-03')
  end
  
  it { should validate_presence_of(:concept) }
end
