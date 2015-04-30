class BlobsController < ApplicationController
  before_action :set_blob, only: [:show, :edit, :update, :destroy]
  before_action :require_user

  # GET /blobs/new
  def new
    @user = current_user
    @datum = @user.data.new
    @blob = Blob.new
    @datum.datable = @blob
  end

  # POST /blobs
  def create
    @user = current_user
    @blob = Blob.new(blob_params)
    @datum = @blob.datum
    @datum.user = current_user

    if @blob.save && @datum.save
      redirect_to @datum, notice: 'File was successfully uploaded.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blob
      @blob = Blob.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blob_params
      params.require(:blob).permit(:file, :datum, datum_attributes: [:title, :description, :price])
    end
end
