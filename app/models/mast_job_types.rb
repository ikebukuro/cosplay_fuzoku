class MastJobTypes < ActiveRecord::Base
  has_many :shop_infos
  #belongs_to :shop_infos
end
