class Api::V1::LapsesController < Api::V1::BaseController
  before_action :set_lapse, only: [:show, :update, :destroy]

  def index
    @lapses = Lapse.all
  end

  def show
  end

  def create
    @lapse = Lapse.new(lapse_params)

    if @lapse.save
      redirect_to @lapse, notice: success_message
    else
      render :new
    end
  end

  def update
    if @lapse.update(lapse_params)
      redirect_to @lapse, notice: success_message
    else
      render :edit
    end
  end

  def destroy
    @lapse.destroy
    redirect_to lapses_url, notice: success_message
  end

  private
    def set_lapse
      @lapse = Lapse.find(params[:id])
    end

    def lapse_params
      params.require(:lapse).permit(:name)
    end
end
