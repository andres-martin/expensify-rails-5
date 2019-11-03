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
#  type_id    :integer
#

class Expense < ApplicationRecord
    belongs_to :type
    validates_presence_of :concept, :date, :type_id
    validates :amount, presence: true, numericality: { only_integer: true }
    # validates_format_of :date, :with => /\d{2}\-\d{2}\-\d{4}/, message: "Date should have the following format dd-mm-yyyy"
end
