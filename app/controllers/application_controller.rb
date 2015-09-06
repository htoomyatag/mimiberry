class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_cloths

  private
  def get_cloths
     @cloths = Cloth.all
     @cart = current_cart
     @cloth_category = Cloth.select(:category).distinct
     @cloth_brand = Cloth.select(:brand).distinct.first(8)
     @cloth_name = Cloth.select(:item_name).distinct.last(8)
  end

   def current_cart

      Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
      
   end


  def reset_cart
     Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
      session[:cart_id] = nil
      cart
  end

end
