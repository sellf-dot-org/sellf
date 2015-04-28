class BlobsController < ApplicationController
  before_action :set_blob, only: [:show, :edit, :update, :destroy]

  # GET /blobs
  def index
    @blobs = Blob.all
  end

  # GET /blobs/new
  def new
    @user = current_user
    @datum = @user.data.new
    @blob = Blob.new
    @datum.datable = @blob
  end

  # GET /blobs/1/edit
  def edit
  end

  # POST /blobs
  def create
    @user = current_user
    @blob = Blob.new(blob_params)
    @datum = @blob.datum
    @datum.user = current_user

    if @blob.save && @datum.save
      redirect_to @datum, notice: 'Blob was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blobs/1
  def update
    if @blob.update(blob_params)
      redirect_to @blob, notice: 'Blob was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /blobs/1
  def destroy
    @blob.destroy
    redirect_to blobs_url, notice: 'Blob was successfully destroyed.'
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
