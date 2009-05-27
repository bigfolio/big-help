class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name, :business, :email, :template, :server, :domain, :database_name, :database_user, :database_password, :web_user, :web_password, :admin_user, :admin_password
      t.decimal :monthly_fee, :precision => 10, :scale => 2
      t.date :signup_date, :billing_date
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
