class Cloth < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  CATEGORY = ["Games","Memes", "Heros", "Techs", "Animes" ]


	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	# ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		if line_items.count.zero?
			return true
		else
			errors[:base] << "Line Items present"
			return false
		end
	end

	before_save do
  		self.item_code = self.item_name
	end

end











