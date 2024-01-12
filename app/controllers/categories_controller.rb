class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    # rubocop:disable Layout/LineLength
    @categories = Category.includes(category_transaction_details: [:transaction_detail]).where(user_id: current_user.id).order(created_at: :desc)
    # rubocop:enable Layout/LineLength
    @total_expenses = @categories.sum(&:total_amount_spent)
  end

  def show
    @transactions = @category.transaction_details.order(created_at: :desc)

    @total_expenses = @category.total_amount_spent
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.icon = set_category_icon

    @category.user = current_user

    if @category.save
      flash[:success] = 'Category created!'
      redirect_to categories_path
    else
      flash[:danger] = 'Sorry, Try again!'
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    if @category.update(category_params)
      flash[:success] = 'Category updated!'
      redirect_to category_url(@category)
    else
      flash[:danger] = 'Sorry, Try again!'
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy!

    flash[:info] = 'Category deleted!'

    redirect_to categories_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  def random_icon_color
    green = '5FB523'
    blue = '3778C2'

    [green, blue].sample
  end

  def set_category_icon
    @category_icon = "https://placehold.co/30x30@3x/#{random_icon_color}/FFFFFF/webp?text=#{@category.icon}"
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
