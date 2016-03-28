class CreateContactsOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts_offers do |t|
      t.references :contact
      t.references :offer
    end
  end
end
