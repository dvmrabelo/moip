class ChangeColumnType < ActiveRecord::Migration[5.1]
   def change
    rename_column :payments, :type, :description
  end
end
