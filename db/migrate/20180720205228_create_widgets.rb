class CreateWidgets < ActiveRecord::Migration[5.2]
  def change
    create_table :widgets do |t|
      t.text :body
      t.string :headline
      t.string :caption
      t.text :description

      t.timestamps
    end
  end
end
