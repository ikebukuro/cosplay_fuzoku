# encoding: utf-8
class ShopInfos < ActiveRecord::Base
=begin
  belongs_to :mast_area
  belongs_to :mast_prefecture
  belongs_to :mast_job_type
  belongs_to :admin_user
=end
  belongs_to :mast_areas,:foreign_key => "mast_areas_mast_prefecture_id"
  belongs_to :mast_prefectures
  
  #belongs_to :shop_play_category
  
  MAST_BUDGETS = [
    ["¥2,000～",0],
    ["¥5,000～",1],
    ["¥8,000～",2],
    ["¥10,000～",3],
    ["¥13,000～",4],
    ["¥15,000～",5],
    ["¥18,000～",6],
    ["¥20,000～",7],
    ["¥23,000～",8],
    ["¥25,000～",9],
    ["¥28,000～",10],
    ["¥30,000～",11],
    ["¥33,000～",12],
    ["¥35,000～",13],
    ["¥38,000～",14],
    ["¥40,000～",15],
    ["¥50,000～",16],
    ["¥80,000～",17],
    ["¥100,000～",18]
  ]

end
