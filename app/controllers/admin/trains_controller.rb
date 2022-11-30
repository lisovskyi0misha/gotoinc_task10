class Admin::TrainsController < Admin::BaseController

  before_action :set_train, only: %i[ show edit update destroy ]

  def index
    @trains = Train.all
  end

  def show
    @seats = Trains::SeatsCounter.new(@train.wagons).count
    @wagons = @train.ascending_sorting ? @train.wagons.ordered : @train.wagons.reverse_ordered
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.create(train_params)
    if @train.valid?
      redirect_to admin_trains_path
    else
      flash[:error] = @train.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def inline_update
    train = Train.find_by_id(params[:id])
    train.update(number: params[:train][:number])
    if train.valid?
      flash[:success] = t('.success')
    else
      flash[:error] = train.errors.full_messages.join(', ')
    end
    redirect_to admin_trains_path
  end

  def destroy
    @train.destroy
  end

  private

  def set_train
    @train = Train.includes(:wagons).find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, :current_station_id)
  end
end
