class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :concept
      t.integer :amount
      t.date :date

      t.timestamps
    end
  end
end
