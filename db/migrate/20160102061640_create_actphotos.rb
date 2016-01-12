class CreateActphotos < ActiveRecord::Migration
  def change
    create_table :actphotos do |t|
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
