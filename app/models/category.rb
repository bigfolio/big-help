class Category < ActiveRecord::Base
  
  has_many :faqs
  
  def self.list
    find(:all, :order => 'name')
  end
  
end
