class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :subject
      t.text :body
      t.string :name
      t.string :email
      t.string :domain
      t.boolean :urgent
      t.integer :category_id
      t.string :username
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
