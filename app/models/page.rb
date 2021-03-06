class Page < ActiveRecord::Base
	POSITIONS=[ "menu", "footer", "menu_and_footer"]
	default_scope -> {order(sort_order: :asc)}
	scope :enabled, -> { where(enabled: 't') }
	scope :in_menu, -> { enabled.where('(position=? or position=?)', 'menu', 'menu_and_footer') }
	scope :in_footer, -> { enabled.where('(position=? or position=?)', 'footer', 'menu_and_footer') }
	mount_uploader :image, ImageUploader

	include RankedModel
		ranks :sort_order

	include  Seoable

	after_destroy :rebuild_routes
	after_create :rebuild_routes
	after_save :rebuild_routes

	private

	def rebuild_routes
		Rails.application.reload_routes!
	end

end
