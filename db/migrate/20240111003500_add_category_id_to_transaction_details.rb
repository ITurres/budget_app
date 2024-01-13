class AddCategoryIdToTransactionDetails < ActiveRecord::Migration[7.1]
  def change
    add_reference :transaction_details, :category, foreign_key: true
  end
end
