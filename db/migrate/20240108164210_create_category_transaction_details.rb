class CreateCategoryTransactionDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :category_transaction_details do |t|
      t.references :category, null: false, foreign_key: { on_delete: :cascade}
      t.references :transaction_detail, null: false, foreign_key: { on_delete: :cascade}

      t.timestamps
    end
  end
end
