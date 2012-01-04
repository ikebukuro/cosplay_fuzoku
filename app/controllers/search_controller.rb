# encoding: utf-8
class SearchController < ApplicationController
  before_filter :logo_message
  def index
    if !params[:mast_prefectures] && !params[:mast_plays] && !params[:mast_budgets]
      #エリア検索
      if params[:param]
      search_all(params[:param],'none','none')
      end
      #プレイ内容検索
      if params[:play]
      search_all('none',params[:play],'none')
      end
      #最低予算検索
      if params[:budget]
      search_all('none','none',params[:budget])
      end
    else
    #エリア検索
      if params[:mast_prefectures] != nil && params[:mast_prefectures] != ""
      search_prefecture = params[:mast_prefectures]
      else
      search_prefecture = 'none'
      end
      #プレイ内容検索
      if params[:mast_plays] != nil && params[:mast_plays] != ""
      search_play = params[:mast_plays]
      else
      search_play = 'none'
      end
      #最低予算検索
      if params[:mast_budgets] != nil && params[:mast_budgets] != ""
      search_budget = params[:mast_budgets]
      else
      search_budget = 'none'
      end
    search_all(search_prefecture,search_play,search_budget)
    end

  end

  def prefecture
    if params[:param]
    search_link_prefecture(params[:param])
    else
    search_link_prefecture('all')
    end
  end

end
