class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.references :project
      t.string :name
      t.float :price, precision: 7, scale: 2
      t.integer :status, defaulf: 0
      t.datetime :valid_until

      t.timestamps
    end
  end
end
