class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.text :text
      t.timestamps
    end
    add_column :events , :message_id , :integer
    add_index :events , :message_id
  end
end
