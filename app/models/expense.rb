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

class Expense < ApplicationRecord
    belongs_to :type
    belongs_to :category
    validates_presence_of :concept, :type_id, :category_id
    validates :amount, presence: true, numericality: { only_integer: true }
    validates :date, format: { with: /\d{4}-\d{2}-\d{2}/,
        message: "should have the following format yyyy-mm-dd" }
    # validates :date, presence: true
end
