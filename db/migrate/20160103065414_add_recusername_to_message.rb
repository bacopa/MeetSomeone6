class AddRecusernameToMessage < ActiveRecord::Migration
  def change
  	add_column :messages, :recusername, :string
  end
end
