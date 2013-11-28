class OrderDetailController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]
 
  # GET /order_details
  # GET /order_details.json
  def index
    @order_details = OrderDetails.uniq(:order_id)
  end
  # GET /order_details/1
  # GET /order_details/1.json
  def show
    
    @order_details = OrderDetails.where("order_id = ?",params[:id])
    
    @order_details.each do |order_details|
      @orders = Order.where("order_id == ?", order_details.order_id)
    end
    @orders.each do |cus|
        @customer = Customer.where("customer_id = ?", cus.custome_id )
    end
    
   

  end

  # GET /order_details/new
  def new
    @order_detail = OrderDetails.new
  end

  # GET /order_details/1/edit
  def edit
  end

  # POST /order_details
  # POST /order_details.json
  def create
    @order_detail = OrderDetails.new(order_detail_params)

    respond_to do |format|
      if @order_detail.save
        format.html { redirect_to @order_detail, notice: 'Order detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_details/1
  # PATCH/PUT /order_details/1.json
  def update
    respond_to do |format|
      if @order_detail.update(order_detail_params)
        format.html { redirect_to @order_detail, notice: 'Order detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_details/1
  # DELETE /order_details/1.json
  def destroy
    @order_detail.destroy
    respond_to do |format|
      format.html { redirect_to order_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_detail
      @order_detail = OrderDetails.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_detail_params
      params[:order_detail]
    end
end
