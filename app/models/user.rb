class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :usuario_general, class_name: "Usuario::General"

  def myName
    if (self.usuario_general.blank?)
      return self.email
    else
      return self.usuario_general.full_name
    end
  end


end
