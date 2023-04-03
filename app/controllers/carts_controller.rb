class CartsController < ApplicationController
    # before_action :authorize, only: [:index, :show]
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    # before_action :find_cart, only: [:show, :update, :add_item, :remove_item]
  
    def index
      carts = Cart.all
      render json: carts, include: :cart_items, status: :ok
    end
  
    def show
        cart = find_cart
        render json: cart, include: [:cart_items => { include: :food }], status: :ok
      end

    def update
        cart_item = CartItem.find(params[:cart][:cart_items][0][:id])
        if cart_item.update(quantity: params[:cart][:cart_items][0][:quantity])
          render json: cart_item.cart
        else
          render json: { errors: cart_item.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def add_item
        cart = Cart.find(params[:cart_id])
        food = Food.find(params[:food_id])
        cart_item = cart.cart_items.find_or_initialize_by(food: food)
        cart_item.quantity ||= 0
        cart_item.quantity += 1

        if cart_item.save
            render json: cart, include: [:cart_items => { include: :food }], status: :ok
        else
            render json: { error: "There was an error adding the item to your cart. Please try again." }, status: :unprocessable_entity
        end
    end

  
    def remove_item
        cart_item = CartItem.find_by(cart_id: params[:cart_id], food_id: params[:food_id])
      
        if cart_item.present?
          cart_item.destroy
          render json: cart_item.cart, include: [:cart_items => { include: :food }], status: :ok
        else
          render json: { error: "The item you are trying to remove is not in your cart." }, status: :unprocessable_entity
        end
      end
      
  
    private
  
    def find_cart
      cart = Cart.find(params[:cart_id] || params[:id])
    end
  
    def cart_params
        params.require(:cart).permit(cart_items_attributes: [:id, :food_id, :quantity])
    end
  
    def render_not_found_response
      render json: { error: "Cart not found" }, status: :not_found
    end
  end
  