class TripEnrollmentsController < ApplicationController

  layout "ubcsurf_default_layout"

  # GET /trip_enrollments
  # GET /trip_enrollments.xml
  def index
    @trip_enrollments = TripEnrollment.find(:all)

    respond_to do |format|
      #format.html # index.html.erb
      format.html { render(:action => :index, :layout => false) && return } 
      format.xml  { render :xml => @trip_enrollments }
    end
  end

  # GET /trip_enrollments/1
  # GET /trip_enrollments/1.xml
  def show
    @trip_enrollment = TripEnrollment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trip_enrollment }
    end
  end

  # GET /trip_enrollments/new
  # GET /trip_enrollments/new.xml
  def new
    begin
      @trip = Trip.find(params[:trip_id])
      @trip_enrollment = TripEnrollment.new(:rent => false, :gloves => false, :hoody => false, :booties => false,
       :driver => false, :suit => false, :know_suit_size => false, :trip_id => @trip.id)
    rescue Exception => e
      flash[:error] = "error"
      raise e
    end
  
    respond_to do |format|
      format.html {
        render(:action => 'trip_sign_up.rhtml') && return 
      }
      format.xml  { render :xml => @trip_enrollment }
      format.js {
      }
    end
  end

  # GET /trip_enrollments/1/edit
  def edit
    @trip_enrollment = TripEnrollment.find(params[:id])
  end

  # POST /trip_enrollments
  # POST /trip_enrollments.xml
  def create
    @trip_enrollment = TripEnrollment.new(params[:trip_enrollment])
    @trip = @trip_enrollment.trip
    # if params.has_key?(:trip_id)
    #   @trip = Trip.find(params[:trip_id])
    #   @trip_cost = @trip.cost
    # end

    respond_to do |format|
      if @trip_enrollment.save
        @payment = Payment.new
        @payment.save
        @trip_enrollment.payment_id = @payment.id
        
        email = SurfMailer.deliver_trip_enrollment_submitted(@trip_enrollment)

        flash[:notice] = 'TripEnrollment was successfully created.'
        format.html { redirect_to(@trip_enrollment) }
        format.xml  { render :xml => @trip_enrollment, :status => :created, :location => @trip_enrollment }
        format.js {
          render :update do |page|
            page.replace 'trip-form', :partial => 'sign_up_confirmation' 
          end
        }
      else
        format.js {
          flash[:error] = 'Could not create Trip Enrollment.'
          logger.error("ERROR CREATING TRIP ENROLLMENT")
          render :update do |page|
            # page.replace 'trip-form', :partial => 'sign_up_confirmation' 
            # how do you just update messages?
            # render :action => 'form_messages.rjs', :layout => false
            # render(:action => 'create_form', :layout => true)
            page.replace_html 'trip-form', :partial => 'create_form' 
          end
        }
        format.html { 
          render :action => "new" 
        }
        format.xml  { render :xml => @trip_enrollment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trip_enrollments/1
  # PUT /trip_enrollments/1.xml
  def update
    @trip_enrollment = TripEnrollment.find(params[:id])

    respond_to do |format|
      if @trip_enrollment.update_attributes(params[:trip_enrollment])
        flash[:notice] = 'TripEnrollment was successfully updated.'
        format.html { redirect_to(@trip_enrollment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trip_enrollment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_enrollments/1
  # DELETE /trip_enrollments/1.xml
  def destroy
    @trip_enrollment = TripEnrollment.find(params[:id])
    @trip_enrollment.destroy

    respond_to do |format|
      format.html { redirect_to(trip_enrollments_url) }
      format.xml  { head :ok }
    end
  end

  def show_rental_form
    @trip_enrollment = TripEnrollment.new
    @trip_enrollment.rent = true 
    render :update do |page|
      page.replace 'rental-check-box', :partial => 'rental_check_box', :locals => {:action => :hide_rental_form}
      page.show 'rental-form'
    end
  end
  def hide_rental_form
    @trip_enrollment = TripEnrollment.new
    @trip_enrollment.rent = false 
    render :update do |page|
      page.replace 'rental-check-box', :partial => 'rental_check_box', :locals => {:action => :show_rental_form}
      page.hide 'rental-form'
    end
  end
  def show_suit_form
    write_params params, "show_rental_form, param: "
    @trip_enrollment = TripEnrollment.new
    @trip_enrollment.suit = true 
    @trip_enrollment.know_suit_size = true
    render :update do |page|
      page.replace 'suit-size-check-box', :partial => 'suit_size_check_box', 
       :locals => {:action => :hide_suit_form}
      page.show 'suit-size-form'
      page.hide 'height-weight-form'
    end
  end
  def hide_suit_form
    write_params params, "hide_rental_form, param: "
    @trip_enrollment = TripEnrollment.new
    @trip_enrollment.suit = false 
    render :update do |page|
      page.replace 'suit-size-check-box', :partial => 'suit_size_check_box', :locals => {:action => :show_suit_form}
      page.hide 'suit-size-form'
      page.show 'height-weight-form'
    end
  end
  def show_driver_form
    @trip_enrollment = TripEnrollment.new
    @trip_enrollment.driver = true 
    render :update do |page|
      page.show 'driver-form'
      page.replace 'driver-check-box', :partial => 'driver_check_box', 
       :locals => {:action => :hide_driver_form}
    end
  end
  def hide_driver_form
    @trip_enrollment = TripEnrollment.new
    @trip_enrollment.driver = false 
    render :update do |page|
      page.hide 'driver-form'
      page.replace 'driver-check-box', :partial => 'driver_check_box', 
       :locals => {:action => :show_driver_form}
    end
  end  
  def show_tent_form
    @trip_enrollment = TripEnrollment.new
    @trip_enrollment.driver = false 
    render :update do |page|
      page.show 'tent-form'
      #page << "enable_element(\'tent-form\')"
    end
  end

  protected

end
