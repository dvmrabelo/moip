class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :client, foreign_key: true
      t.references :buyer, foreign_key: true
      t.references :payment, foreign_key: true

      t.timestamps
    end
  end
end
