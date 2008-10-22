class RentablesController < ApplicationController
  # GET /rentables
  # GET /rentables.xml
  def index
    @rentables = Rentable.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rentables }
    end
  end

  # GET /rentables/1
  # GET /rentables/1.xml
  def show
    @rentable = Rentable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rentable }
    end
  end

  # GET /rentables/new
  # GET /rentables/new.xml
  def new
    @rentable = Rentable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rentable }
    end
  end

  # GET /rentables/1/edit
  def edit
    @rentable = Rentable.find(params[:id])
  end

  # POST /rentables
  # POST /rentables.xml
  def create
    @rentable = Rentable.new(params[:rentable])

    respond_to do |format|
      if @rentable.save
        flash[:notice] = 'Rentable was successfully created.'
        format.html { redirect_to(@rentable) }
        format.xml  { render :xml => @rentable, :status => :created, :location => @rentable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rentable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rentables/1
  # PUT /rentables/1.xml
  def update
    @rentable = Rentable.find(params[:id])

    respond_to do |format|
      if @rentable.update_attributes(params[:rentable])
        flash[:notice] = 'Rentable was successfully updated.'
        format.html { redirect_to(@rentable) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rentable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rentables/1
  # DELETE /rentables/1.xml
  def destroy
    @rentable = Rentable.find(params[:id])
    @rentable.destroy

    respond_to do |format|
      format.html { redirect_to(rentables_url) }
      format.xml  { head :ok }
    end
  end
end
