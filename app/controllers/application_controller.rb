# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def logo_message
    if params[:param]
      sql = "SELECT mp.name
      FROM prefecture_mappings pm,mast_prefectures mp
      WHERE pm.mast_prefectures_id = mp.id
      AND pm.param = '#{params[:param]}'"
      @logo_message_arr = MastPrefectures.find_by_sql(sql)
      @logo_message_arr.each do |m|
        @logo_message = m.name
      end
    else
    @logo_message = "全国"
    end
  end

  private

  def type_search
    @mast_prefectures = MastPrefectures.all
    @mast_play_categories = MastPlayCategories.all
  end

  private

  def search_link_prefecture(bango)
    #お店情報を取得
    sql = "SELECT DISTINCT(si.id),si.name, si.address, si.price, ma.name AS area_name
    FROM shop_infos si, mast_areas ma, mast_play_categories mpc, shop_play_categories spc,prefecture_mappings pm,mast_prefectures mp
    WHERE si.mast_areas_id = ma.id
    AND spc.shop_infos_id = si.id
    AND spc.mast_play_categories_id = mpc.id
    AND si.mast_areas_mast_prefecture_id = mp.id
    AND pm.mast_prefectures_id = mp.id "
    if bango != 'all'
    sql += "AND pm.param = '#{bango}' "
    end
    @shop_infos =  ShopInfos.paginate_by_sql(sql, :page =>params[:page], :per_page => 50)
    #パン屑リスト
    if bango != 'all'
      sql = "SELECT mp.name FROM mast_prefectures mp,prefecture_mappings pm
      WHERE mp.id = pm.mast_prefectures_id
      AND pm.param = '#{bango}'"
      @prefecture_mappings = PrefectureMappings.find_by_sql(sql)
      @prefecture_mappings.each do |p|
        @breadcrumbs_list =  ' ＞ ' + '全エリア検索結果' + ' ＞ '+p.name+'エリア検索結果'
      end
    end
    #エリア情報を取得
    if bango != 'all'
    sql = "SELECT ma.id,ma.name,pm.param
    FROM mast_prefectures mp,prefecture_mappings pm,mast_areas ma
    WHERE mp.id = pm.mast_prefectures_id
    AND ma.mast_prefecture_id = mp.id
    AND pm.param = '#{bango}' "
    else
    sql = "SELECT mp.id,mp.name,pm.param
    FROM mast_prefectures mp,prefecture_mappings pm
    WHERE mp.id = pm.mast_prefectures_id "
    end
    #@mast_prefectures = MastPrefectures.find_by_sql(sql)
    @mast_prefectures = MastPrefectures.all
    #プレイ内容を取得
    @mast_play_categories = MastPlayCategories.all
  end

  private

  def search_all(prefecture,play,budget)
    p '######################################'+prefecture+'-'+play+'-'+budget
    #お店情報を取得
    sql = "SELECT DISTINCT(si.id),si.name, si.address, si.price, ma.name AS area_name
    FROM shop_infos si, mast_areas ma, mast_play_categories mpc, shop_play_categories spc,prefecture_mappings pm,mast_prefectures mp
    WHERE si.mast_areas_id = ma.id
    AND spc.shop_infos_id = si.id
    AND spc.mast_play_categories_id = mpc.id
    AND si.mast_areas_mast_prefecture_id = mp.id
    AND pm.mast_prefectures_id = mp.id "
    if prefecture != 'none'
    sql += "AND mp.id = #{prefecture} "
    end
    if play != 'none'
    sql += "AND mpc.id = #{play} "
    end
    if budget != 'none'
    sql += "AND si.price > #{budget} "
    end
    sql += "ORDER BY si.id ASC"
    @shop_infos = ShopInfos.paginate_by_sql(sql,:page => params[:page], :per_page => 50)
    count_shop_infos = ShopInfos.find_by_sql(sql).count
    p '######################################'+count_shop_infos.to_s
    #パン屑リスト
    if prefecture == 'none'
    @breadcrumbs_list =  ' ＞ 全エリア検索結果'
    end
    #エリア情報を取得
    sql = "SELECT mp.id,mp.name,pm.param
    FROM mast_prefectures mp,prefecture_mappings pm
    WHERE mp.id = pm.mast_prefectures_id "
    @mast_prefectures = MastPrefectures.find_by_sql(sql)
    #プレイ内容を取得
    @mast_play_categories = MastPlayCategories.all
  end

end
