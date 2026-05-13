class AddLoanAndDueDateToLoans < ActiveRecord::Migration[8.1]
  def change
    add_column :loans, :loan_date, :date
    add_column :loans, :due_date, :date
  end
end
