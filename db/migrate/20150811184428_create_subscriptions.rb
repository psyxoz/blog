class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :email, null: false
      t.string :token, null: false
      t.timestamps null: false
    end

    add_index :subscriptions, :token
    add_index :subscriptions, :email, unique: true
  end
end
