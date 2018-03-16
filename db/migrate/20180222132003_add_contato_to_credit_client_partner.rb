class AddContatoToCreditClientPartner < ActiveRecord::Migration[5.0]
  def change
    add_reference :credit_client_partner_bases, :contato, index:true
  end
end
