# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  concept     :string
#  amount      :integer
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  type_id     :integer
#  category_id :integer
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
 
  it { should belong_to(:type) }
  it { should belong_to(:category) }
  it { should validate_presence_of(:type_id) }
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:concept) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:date) }
  it { should validate_numericality_of(:amount) }

  it { should_not allow_value(11.2019).for(:amount) }
  it { should allow_value("03-11-2019").for(:date) }
  it { should_not allow_value("AA/11/2019").for(:date) }

end
