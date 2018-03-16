class CreateCreditClientEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_emails do |t|
      t.string :email
      t.string :contact
      t.references :credit_client_general, foreign_key: { to_table: "credit_client_contact_bases"}

      t.timestamps
    end
  end
end
