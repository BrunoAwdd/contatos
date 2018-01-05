class Usuario::General < ApplicationRecord
  belongs_to :user
  belongs_to :usuario_role, class_name: "Usuario::Role",  foreign_key: 'usuario_roles_id'

  def full_name
    name + ' ' + last_name
  end


end
