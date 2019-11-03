class AddTypeToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_reference :expenses, :type, foreign_key: true
  end
end
