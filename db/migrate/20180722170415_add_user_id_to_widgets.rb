class AddUserIdToWidgets < ActiveRecord::Migration[5.2]
  def change
    add_column :widgets, :user_id, :integer
  end
end
