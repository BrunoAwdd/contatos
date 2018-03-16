class AddMessagesCountToUserMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :usuario_generals, :messages_count, :integer, :default => 0
  end
end
