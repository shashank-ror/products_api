module Api
  class ProductsController < ApplicationController
    before_action :set_product, only: [:update, :destroy]

    def index
      @products = Product.where(status: 'approved').order(created_at: :desc)
      render json: @products
    end

    def search
      @products = Product.where(nil)
      @products = @products.where("name LIKE ?", "%#{params[:name]}%") if params[:name].present?
      @products = @products.where(price: params[:minPrice]..params[:maxPrice]) if params[:minPrice].present? && params[:maxPrice].present?
      @products = @products.where('price >= ?', params[:minPrice]) if params[:minPrice].present? && params[:maxPrice].nil?
      @products = @products.where('price == ?', params[:maxPrice]) if params[:maxPrice].present? && params[:minPrice].nil?
      @products = @products.where(created_at: params[:minPostedDate]..params[:maxPostedDate]) if params[:minPostedDate].present? && params[:maxPostedDate].present?
      render json: @products
    end

    def create
      @product = Product.new(product_params)
      if @product.price >= 5000
        @product.status = 'approve_queue'
        @product.request_date = Time.now
      else
        @product.status = 'inprogress'
      end
      if @product.save
        render json: @product, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    def update
      if @product.update(product_params)
        if @product.price >= 5000
          @product.status = 'approve_queue'
          @product.request_date = Time.now
        else
          @product.update(status: 'inprogress')
        end
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    def destroy
      product = Product.find(params[:id])
      product.update(status: 'approve_queue', request_date: Time.now, is_deleted: 1)
      #@product.destroy
      #head :no_content
      render json: {message: "Product deleted, and pushed to the approval queue."}
    end

    def approval_queue
      @queue = Product.where("status = 'approved_queue'", ).order(request_date: :asc)
      render json: @queue
    end

    def approve
      product = Product.find(params[:id])
      product.update(status: 'approved', request_date: nil)
      render json: {message: "Product successfully Approved."}
    end

    def reject
      product = Product.find(params[:id])
      product.update(status: 'rejected', request_date: nil)
      render json: {message: "Product Rejectd."}
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :status)
    end
  end
end
