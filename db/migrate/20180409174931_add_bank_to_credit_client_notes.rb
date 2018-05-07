class AddBankToCreditClientNotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :credit_client_notes, :credit_bank_general, index:true
  end
end
