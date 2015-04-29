class DataController < ApplicationController
  before_action :set_datum, only: [:show, :edit, :update, :destroy, :buy]
  before_action :require_user, except: [:index]

  # GET /data
  # list of data
  def index
    @data = Datum.all
  end

  #GET /data/1
  def show
  end

  def destroy
    @datum.destroy
    redirect_to data_url, notice: 'Datum was successfully destroyed.'
  end

  def buy
    user = @datum.user

    amount = @datum.price_cents

    fee = (amount * Rails.application.secrets.fee_percentage).to_i

    begin
      charge_attrs = {
        amount: amount,
        currency: user.currency,
        source: params[:token],
        description: "Test Charge via Stripe Connect",
        application_fee: fee
      }

      # Use the user-to-be-paid's access token
      # to make the charge directly on their account
      charge = Stripe::Charge.create( charge_attrs, user.stripe_secret_key )

      Purchase.create(amount_cents: amount, user: current_user, datum: @datum)

      flash[:notice] = "Charged successfully!"

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
