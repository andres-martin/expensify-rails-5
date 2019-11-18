# frozen_string_literal: true

##
# This class represents a Expense model
class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]
  before_action :set_expenses, only: [:index, :create, :destroy]

  def index
    @tab = :expenses
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
    if @expense.save
      message = "<p>The #{@expense.type.name.downcase} <b>#{@expense.concept}</b> for
          <b>#{@expense.amount}</b> on <b>#{@expense.date.to_formatted_s(:short)}</b> was created successfully!</p>"
      flash.now[:notice] = message.html_safe
    end
  end

  def edit; end

  def update
    @expense.update(expense_params)
    message = "The expense was updated successfully!"
    flash.now[:notice] = message.html_safe
  end

  def destroy
    if @expense.destroy
      message = "The #{@expense.type.name.downcase} <b>#{@expense.concept}</b> for
          <b>#{@expense.amount}</b> on <b>#{@expense.date.to_formatted_s(:short)}</b> was destroyed successfully!"
      flash.now[:notice] = message.html_safe
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_expenses
    @expenses = Expense.all.order('date DESC')

    @expenses_sum = @expenses.pluck(:amount).sum
    @expenses_avg = @expenses.pluck(:amount).sum / @expenses.count
  end

  def expense_params
    params.require(:expense).permit(:concept, :amount,
                                    :date, :type_id, :category_id)
  end
end
