class Api::V1::MomentsController <  Api::BaseController
  before_action :set_moment, only: [:show, :destroy]
  before_action :current_lapse, only: [:create]

  def index
    @moments = Moment.all
  end

  def show
    render :show, status: 200
  end

  def create
    @moment = Moment.new(moment_params)
    @moment.lapse = @lapse
    if @moment.save
      render :show, status: 201
    else
      @resourceful_errors = @moment.errors.messages
      render 'api/errors/resourceful_error', status: 422
    end
  end

  def destroy
    @moment.destroy!
    render :show, status: 200
  end

  private
    def set_moment
      @moment = Moment.find(params[:id])
    end

    def current_lapse
      @lapse = Lapse.find(params[:lapse_id])
    end

    def moment_params
      params.permit(:active)
    end
end
