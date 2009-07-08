class MessagesController < ApplicationController

  before_filter :login_required, :except => [:create]

  # GET /messages
  # GET /messages.xml
  def index
    @messages = Message.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.xml
  def create
    
    @ticket = Ticket.find(params[:ticket_id])
    @message = @ticket.messages.build(params[:message])
    @message.user = current_user
    respond_to do |format|
      if @message.save
        flash[:notice] = 'Message was successfully created.'
        if current_user
          @ticket.close! if params[:close_ticket]
          format.html { redirect_to(@ticket) }
          
          # Send a text message to the customer
          # This should really be done in the model, but sms-fu doesn't seem to like that 
          url = view_by_key_url(@ticket.key, :host => 'bighelp.bigfolio.com')
          deliver_sms(@ticket.mobile_number.gsub(/[^0-9]/,""), @ticket.carrier_name, "We have an update to your support request (#{@ticket.key}). Please visit #{url}") unless @ticket.mobile_number.blank?
          
          
        else
          format.html { redirect_to(view_by_key_url(@ticket.key)) }
        end
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        flash[:notice] = 'Message was successfully updated.'
        format.html { redirect_to(@message) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end
end
