class AddJudgeToProcessos < ActiveRecord::Migration
  def change
    add_column :juridico_processos, :judge, :string
    add_column :juridico_processos, :classe, :string
  end
end
