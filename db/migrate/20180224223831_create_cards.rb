class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :cardHolderName
      t.string :cardNumber
      t.string :cardExpirationDate
      t.integer :cardCvv

      t.timestamps
    end
  end
end
