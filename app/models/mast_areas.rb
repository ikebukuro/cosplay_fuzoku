class MastAreas < ActiveRecord::Base
  belongs_to :mast_prefectures,:foreign_key => "mast_prefecture_id"
  #has_many :shop_infos
end
