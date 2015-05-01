class DataController < ApplicationController
  before_action :set_datum, only: [:show, :edit, :update, :destroy, :buy, :appraise]
  before_action :require_user, except: [:index, :show]

  # GET /data
  # list of data
  def index
    @data = Datum.all
  end

  #GET /data/1
  def show
  end

  def destroy
    @datum.datable.destroy
    @datum.destroy
    redirect_to data_url, notice: 'Datum was successfully destroyed.'
  end

  # this is the pre-buy page with pricing and fee info
  def appraise
    @user = @datum.user
    @percentage = Rails.application.secrets.fee_percentage
    @amount = @datum.price_cents
    @fee = (@amount * @percentage)
    if @datum.user.stripe_account_status["charges_enabled"]
      @do_it = true
    else
      flash[:notice] = "#{@user.name} is not accepting sales :("
      @do_it = false
    end
  end

  def buy
    user = current_user

    amount = @datum.price_cents

    fee = (amount * Rails.application.secrets.fee_percentage).to_i

    begin
      charge_attrs = {
        amount: amount,
        currency: 'USD',
        source: params[:token],
        description: @datum.title,
        application_fee: fee,
        destination: @datum.user.stripe_user_id
      }

      # Use the user-to-be-paid's access token
      # to make the charge directly on their account
      charge = Stripe::Charge.create( charge_attrs, ENV['STRIPE_SECRET_KEY'] )

      Purchase.create(amount_cents: amount, user: current_user, datum: @datum)

      flash[:notice] = "Charged successfully!"

      Rails.logger.fatal "****** HEY A STRIPE CHARGE EVENT WENT THROUGH *******"

      redirect_to buy_path

    rescue Stripe::CardError => e
      error = e.json_body[:error][:message]
      flash[:error] = "Charge failed! #{error}"
    end
  end

  private
    def set_datum
      @datum = Datum.find(params[:id])
    end

    def datum_params
      params[:datum]
    end

end
