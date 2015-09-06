class LineItem < ActiveRecord::Base

	belongs_to :cloth
	belongs_to :cart

	def total_price
		if quantity == 1
			cloth.price * quantity
		
		elsif quantity == 2
			cloth.price + 5000
		
	    elsif quantity == 3
			cloth.price + 10000

		elsif quantity == 4
			cloth.price + 15000
		
	    elsif quantity == 5
			cloth.price + 20000
		
		else
	    end
	end

	

end


