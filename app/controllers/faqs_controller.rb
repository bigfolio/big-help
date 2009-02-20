class FaqsController < ApplicationController
  # GET /faqs
  # GET /faqs.xml
  def index
    @faqs = Faq.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @faqs }
    end
  end

  # GET /faqs/1
  # GET /faqs/1.xml
  def show
    @faq = Faq.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @faq }
    end
  end

  # GET /faqs/new
  # GET /faqs/new.xml
  def new
    @faq = Faq.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @faq }
    end
  end

  # GET /faqs/1/edit
  def edit
    @faq = Faq.find(params[:id])
  end

  # POST /faqs
  # POST /faqs.xml
  def create
    @faq = Faq.new(params[:faq])

    respond_to do |format|
      if @faq.save
        flash[:notice] = 'Faq was successfully created.'
        format.html { redirect_to(faqs_url) }
        format.xml  { render :xml => @faq, :status => :created, :location => @faq }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @faq.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /faqs/1
  # PUT /faqs/1.xml
  def update
    @faq = Faq.find(params[:id])

    respond_to do |format|
      if @faq.update_attributes(params[:faq])
        flash[:notice] = 'Faq was successfully updated.'
        format.html { redirect_to(@faq) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @faq.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.xml
  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy

    respond_to do |format|
      format.html { redirect_to(faqs_url) }
      format.xml  { head :ok }
    end
  end
end
