class AddFreeToJuridicoProcessos < ActiveRecord::Migration
  def change
    add_column :juridico_processos, :free, :integer
  end
end
