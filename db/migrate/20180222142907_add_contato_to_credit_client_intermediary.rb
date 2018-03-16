class AddContatoToCreditClientIntermediary < ActiveRecord::Migration[5.0]
  def change
    add_reference :credit_client_intermediaries, :contato, index:true
  end
end
