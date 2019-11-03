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
  it { should validate_presence_of(:concept) }
end
