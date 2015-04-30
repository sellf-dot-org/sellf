class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show]
  before_action :require_user

  # GET /purchases
  def index
    if current_user.admin?
      @purchases = Purchase.all
    else
      @purchases = current_user.purchases.all
    end
  end

  # GET /purchases/1
  def show
    redirect 'data_url' unless current_user == @purchase.user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_params
      params[:purchase]
    end
end
