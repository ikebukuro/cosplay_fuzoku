class HomeController < ApplicationController
  before_filter :logo_message
  def index
    sql = "SELECT si.id,si.name,si.address,si.price,ma.name AS area_name
    FROM shop_infos si,mast_areas ma
    WHERE si.mast_areas_id=ma.id "
    #東京
    #@shop_infos_tokyo = ShopInfos.where("mast_areas_mast_prefecture_id = 48").limit(50)
    sql_tokyo = sql+"AND mast_areas_mast_prefecture_id = 48 LIMIT 50"
    @shop_infos_tokyo = ShopInfos.find_by_sql(sql_tokyo)
    #大阪
    #@shop_infos_osaka = ShopInfos.where("mast_areas_mast_prefecture_id = 33").limit(50)
    sql_osaka = sql+"AND mast_areas_mast_prefecture_id = 33 LIMIT 50"
    @shop_infos_osaka = ShopInfos.find_by_sql(sql_osaka)
    #神奈川
    #@shop_infos_kanagawa = ShopInfos.where("mast_areas_mast_prefecture_id = 47").limit(50)
    sql_kanagawa = sql+"AND mast_areas_mast_prefecture_id = 47 LIMIT 50"
    @shop_infos_kanagawa = ShopInfos.find_by_sql(sql_kanagawa)
    #埼玉
    #@shop_infos_saitama = ShopInfos.where("mast_areas_mast_prefecture_id = 37").limit(50)
    sql_saitama = sql+"AND mast_areas_mast_prefecture_id = 37 LIMIT 50"
    @shop_infos_saitama = ShopInfos.find_by_sql(sql_saitama)
    #千葉
    #@shop_infos_chiba = ShopInfos.where("mast_areas_mast_prefecture_id = 49").limit(50)
    sql_chiba = sql+"AND mast_areas_mast_prefecture_id = 49 LIMIT 50"
    @shop_infos_chiba = ShopInfos.find_by_sql(sql_chiba)
    #福岡
    #@shop_infos_fukuoka = ShopInfos.where("mast_areas_mast_prefecture_id = 11").limit(50)
    sql_fukuoka = sql+"AND mast_areas_mast_prefecture_id = 11 LIMIT 50"
    @shop_infos_fukuoka = ShopInfos.find_by_sql(sql_fukuoka)
    #愛知
    #@shop_infos_aichi = ShopInfos.where("mast_areas_mast_prefecture_id = 45").limit(50)
    sql_aichi = sql+"AND mast_areas_mast_prefecture_id = 45 LIMIT 50"
    @shop_infos_aichi = ShopInfos.find_by_sql(sql_aichi)
    #兵庫
    #@shop_infos_hyogo = ShopInfos.where("mast_areas_mast_prefecture_id = 14").limit(50)
    sql_hyogo = sql+"AND mast_areas_mast_prefecture_id = 14 LIMIT 50"
    @shop_infos_hyogo = ShopInfos.find_by_sql(sql_hyogo)

    #全国のコスプレ風俗店を探す
    #都道府県・エリア
    @mast_prefectures = MastPrefectures.all
    #可能タイプ
    @mast_play_categories = MastPlayCategories.all
  #最低予算
  #nothing to do here

  end

end
