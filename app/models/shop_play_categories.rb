class ShopPlayCategories < ActiveRecord::Base
  belongs_to :shop_infos
  belongs_to :mast_play_categories
end
