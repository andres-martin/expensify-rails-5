# frozen_string_literal: true

##
# This class represents a Expense model
class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @expenses = Expense.all.order('date DESC')
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
  end

  private

  def expense_params
    params.require(:expense).permit(:concept, :amount,
                                    :date, :type_id, :category_id)
  end
end
