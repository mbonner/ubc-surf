class PaymentsController < ApplicationController

  include ActiveMerchant::Billing::Integrations
  layout "ubcsurf_default_layout"

  # GET /payments
  # GET /payments.xml
  def index
    @payments = Payment.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.xml
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.xml
  def new
    payment_type = nil 
    if params.has_key? :payment_type
      payment_type = params[:payment_type]
    else
      payment_type = 'sign_up'
    end
    @payment = Payment.new

    respond_to do |format|
      format.html {
        case payment_type
        when 'sign_up'
          # really want to go to a form, that submits here, i save that info, populate the send
          # thing and send it off to payp.
          render(:action => 'sign_up.rhtml') && return 
        when 'trip'
          render(:action => 'trip_sign_up.rhtml') && return 
        else
        end
      }
      format.xml  { render :xml => @payment }
    end
  end
  def thank_you
  end
  def payment_error
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.xml
  def create
    @payment = Payment.new(params[:payment])

    respond_to do |format|
      if @payment.save
        flash[:notice] = 'Payment was successfully created.'
        format.html { redirect_to(@payment) }
        format.xml  { render :xml => @payment, :status => :created, :location => @payment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.xml
  def update
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        flash[:notice] = 'Payment was successfully updated.'
        format.html { redirect_to(@payment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.xml
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to(payments_url) }
      format.xml  { head :ok }
    end
  end
  def notify

    write_params params, "PaymentsController::notify, param: "
# request?
    notify = Paypal::Notification.new(request.raw_post)
    payment = Payment.find(notify.item_id)

    if notify.acknowledge
# hmmm need to look at this, 
      # I have no idea how this works.
                               # where would confimation be set to make this work?
      @payment = Payment.find_by_confirmation(notify.transaction_id) ||
       payments.create(:amount => notify.amount,
       #enrollment.invoice.payments.create(:amount => notify.amount,
       :payment_method => 'paypal', :confirmation => notify.transaction_id,
       :description => notify.params['item_name'], :status => notify.status,
       :test => notify.test?)
      begin
        if notify.complete?
          @payment.status = notify.status
        else
          logger.error("Failed to verify Paypal's notification, please investigate")
        end
      rescue => e
        @payment.status = 'Error'
        raise
      ensure
        @payment.save
      end
    end
    render :nothing => true
  end

  protected

end
