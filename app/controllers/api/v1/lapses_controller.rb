class Api::V1::LapsesController < Api::BaseController
  before_action :set_lapse, only: [:show, :update, :destroy]

  def index
    @lapses = Lapse.all
  end

  def show
    render :show, status: 200
  end

  def create
    @lapse = Lapse.new(lapse_params)
    if @lapse.save
      render :show, status: 201
    else
      @resourceful_errors = @lapse.errors.messages
      render 'api/errors/resourceful_error', status: 422
    end
  end

  def update
    if @lapse.update(lapse_params)
      render :show, status: 200
    else
      @resourceful_errors = @lapse.errors.messages
      render 'api/errors/resourceful_error', status: 422
    end
  end

  def destroy
    @lapse.destroy!
    render :show, status: 200
  end

  private
    def set_lapse
      @lapse = Lapse.find(params[:id])
    end

    def lapse_params
      params.permit(:name)
    end
end
