class HelpController < ApplicationController
  
  before_filter :redirect_to_new_support
  
  # All the actions here are for the customer view, so no authentication required
  
  def index
    
  end
  
  def contact
    
  end
  
  def faqs
    @faqs = Faq.find(:all, :conditions => ['category_id = ?', params[:id]])
    render :layout => false
  end
  
  def view_by_key
    @ticket = Ticket.find_by_key(params[:key])
  end
  
  def search_by_key
    @ticket = Ticket.find_by_key(params[:key])
    redirect_to @ticket ? view_by_key_url(@ticket.key) : root_url
  end
  
end
