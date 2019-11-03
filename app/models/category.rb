# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
    has_many :expenses, dependent: :destroy
    validates :name, presence: true
    validates :name, :uniqueness => { case_sensitive: false }
end
