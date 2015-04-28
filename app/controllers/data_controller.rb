class DataController < ApplicationController
  before_action :set_datum, only: [:show, :edit, :update, :destroy]

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

  private
    def set_datum
      @datum = Datum.find(params[:id])
    end

    def datum_params
      params[:datum]
    end

end
