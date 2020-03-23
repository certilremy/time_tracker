class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :name
      t.integer :amoun
      t.timestamps
    end
  end
end
