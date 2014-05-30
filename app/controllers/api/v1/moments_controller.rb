class Api::V1::MomentsController <  Api::V1::BaseController
  before_action :set_moment, only: [:show, :destroy]

  def index
    @moments = Moment.all
  end

  def show
  end

  def create
    @moment = Moment.new(moment_params)

    if @moment.save
      redirect_to @moment, notice: success_message
    else
      render :new
    end
  end

  def destroy
    @moment.destroy
    redirect_to moments_url, notice: success_message
  end

  private
    def set_moment
      @moment = Moment.find(params[:id])
    end

    def moment_params
      params.require(:moment).permit(:lapse_id, :image)
    end
end
