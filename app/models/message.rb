class Message < ActiveRecord::Base

  belongs_to :ticket
  belongs_to :user
  
  has_attached_file :attachment,
    :path => ":rails_root/public/uploads/:attachment/:id/:basename.:extension",
    :url => "/uploads/:attachment/:id/:basename.:extension"
    
  
  def classes
    klass = self.user ? 'staff_message' : 'customer_message'
  end
  
end
