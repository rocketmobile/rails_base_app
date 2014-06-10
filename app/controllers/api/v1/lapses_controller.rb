class Api::V1::LapsesController < Api::BaseController
  before_action :set_lapse, only: [:show, :update, :destroy]

  def index
    @lapses = Lapse.all
  end

  def show
    render :show, status: 200
  end

  # Creates a new lapse for the current user
  # @param name [String] The name identifying the lapse
  # @param favorite [Boolean] Whether or not the lapse has been favorited
  # @return {Lapse}
  def create
    @lapse = Lapse.new(lapse_params)
    if @lapse.save
      render :show, status: 201
    else
      render :show, status: 400
    end
  end

  def update
    if @lapse.update(lapse_params)
      render :show, status: 200
    else
      render :show, status: 400
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
