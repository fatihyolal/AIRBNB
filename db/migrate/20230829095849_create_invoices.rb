class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :renter_address
      t.float :total_price
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
