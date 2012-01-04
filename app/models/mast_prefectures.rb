class MastPrefectures < ActiveRecord::Base
  has_one :prefecture_mappings
  has_many :shop_infos
  has_many :mast_areas
=begin
  has_one :prefecture_mapping
  has_many :mast_area
  has_many :shop_info
=end
end
