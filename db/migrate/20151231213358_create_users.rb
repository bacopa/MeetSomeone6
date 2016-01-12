class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.integer :age
      t.string :password_digest
      t.string :gender
      t.string :seeking

      t.timestamps null: false
    end
  end
end
