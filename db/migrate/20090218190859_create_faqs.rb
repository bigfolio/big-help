class CreateFaqs < ActiveRecord::Migration
  def self.up
    create_table :faqs do |t|
      t.string :title
      t.text :body
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :faqs
  end
end
