class AddColumnsToMessage < ActiveRecord::Migration
	def change
		add_column :messages, :recipient, :integer
	end
end
