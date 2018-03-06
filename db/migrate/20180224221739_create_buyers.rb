class CreateBuyers < ActiveRecord::Migration[5.1]
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :email
      t.string :cpf

      t.timestamps
    end
  end
end
