class Cart < ActiveRecord::Base

	has_many :line_items, :dependent => :destroy

	def add_item(cloth_id)
		current_item = line_items.where(:cloth_id => cloth_id).first
		if current_item
			current_item.quantity += 1
		else
			current_item = LineItem.new(:cloth_id=> cloth_id)
			line_items << current_item
		end
		current_item
	end


	def total_price
		line_items.to_a.sum { |cloth| cloth.total_price }
	end

    def total_quantity
		line_items.to_a.sum { |cloth| cloth.quantity }
	end

	



end
