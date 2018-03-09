class BandsController < ApplicationController
  def index
    @bands = Band.all
    @user = current_user
    render :index
  end

  def new
    render :new
  end


  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_url
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to :new
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])

  end

  def update

    @band = Band.find_by(id: params[:id])

    if @band.update(band_params)
      flash[:success] = ["Successfully changed the band name!"]
      render :show
    else
      render json: "asf"
    end
  end


  def show
    @band = Band.find_by(id: params[:id])

    if @band
      render :show
    else
      flash[:errors] = ["That band doesnt exist motherf*cker"]
      redirect_to bands_url
    end


  end


  def destroy
    @band = Band.find_by(id: params[:id])
    @band.destroy!
    flash[:success] = ["Successfully deleted band!"]
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
