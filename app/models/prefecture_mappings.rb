class PrefectureMappings < ActiveRecord::Base
  belongs_to :mast_prefectures,:foreign_key => "mast_prefectures_id"
end
