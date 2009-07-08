class AddMobileInfoToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :mobile_number, :string
    add_column :tickets, :carrier_name, :string
  end

  def self.down
  end
end
