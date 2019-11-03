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

class Expense < ApplicationRecord
    validates :concept, presence: true
end
