class AddEventIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :event_id, :integer
  end
end
