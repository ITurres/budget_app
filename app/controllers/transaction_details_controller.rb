class TransactionDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction_detail, only: %i[show edit update destroy]

  # GET /transaction_details or /transaction_details.json
  def index
    @transaction_details = TransactionDetail.all
  end

  # GET /transaction_details/1 or /transaction_details/1.json
  def show; end

  # GET /transaction_details/new
  def new
    @transaction_detail = TransactionDetail.new
  end

  # GET /transaction_details/1/edit
  def edit; end

  # POST /transaction_details or /transaction_details.json
  def create
    @transaction_detail = TransactionDetail.new(transaction_detail_params)

    respond_to do |format|
      if @transaction_detail.save
        format.html do
          redirect_to transaction_detail_url(@transaction_detail),
                      notice: 'Transaction detail was successfully created.'
        end
        format.json { render :show, status: :created, location: @transaction_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaction_details/1 or /transaction_details/1.json
  def update
    respond_to do |format|
      if @transaction_detail.update(transaction_detail_params)
        format.html do
          redirect_to transaction_detail_url(@transaction_detail),
                      notice: 'Transaction detail was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @transaction_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_details/1 or /transaction_details/1.json
  def destroy
    @transaction_detail.destroy!

    respond_to do |format|
      format.html { redirect_to transaction_details_url, notice: 'Transaction detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction_detail
    @transaction_detail = TransactionDetail.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_detail_params
    params.require(:transaction_detail).permit(:name, :amount, :user_id)
  end
end
