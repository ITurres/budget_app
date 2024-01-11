class TransactionDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction_detail, only: %i[destroy], except: %i[create]

  # GET /transaction_details/new
  def new
    @transaction_detail = TransactionDetail.new

    @categories = Category.all
  end

  # POST /transaction_details or /transaction_details.json
  def create
    @transaction_detail = TransactionDetail.new(name: transaction_detail_params[:name],
                                                amount: transaction_detail_params[:amount],
                                                user_id: current_user.id)

    @transaction_detail.user = current_user

    if @transaction_detail.save
      # rubocop:disable Layout/LineLength
      @category_transaction_details = CategoryTransactionDetail.new(category_id: transaction_detail_params[:category_id],
                                                                    transaction_detail_id: @transaction_detail.id)
      # rubocop:enable Layout/LineLength
      if @category_transaction_details.save
        flash[:success] = 'Transaction created!'
        redirect_to category_path(transaction_detail_params[:category_id])
      else
        flash[:danger] = 'Sorry, Try again!'
        redirect_to new_transaction_detail_path
      end
    else
      flash[:danger] = 'Sorry, Try again!'
      redirect_to new_transaction_detail_path
    end
  end

  # DELETE /transaction_details/1 or /transaction_details/1.json
  def destroy
    @transaction_detail.destroy!

    flash[:info] = 'Transaction deleted!'
    redirect_to transaction_details_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction_detail
    @transaction_detail = TransactionDetail.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_detail_params
    params.require(:transaction_detail).permit(:name, :amount, :category_id)
  end
end
