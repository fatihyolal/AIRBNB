class ChangeDate < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :date, :start_date
  end
end
