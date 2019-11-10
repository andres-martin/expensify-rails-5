# frozen_string_literal: true

##
# This class represents a Expense model
class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]

  def index
    @tab = :expenses
    @expenses = Expense.all.order('date DESC')
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
    if @expense.save
      flash[:notice] = "The #{@expense.type.name} #{@expense.concept} for #{@expense.amount} on #{@expense.date.to_formatted_s(:short)} created"
    end
  end

  def edit; end

  def update
    @expense.update(expense_params)
    flash.now[:notice] = "The expense was updated successfully!"
  end

  def destroy
    @expense.destroy
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:concept, :amount,
                                    :date, :type_id, :category_id)
  end
end
