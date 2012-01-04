class ShopController < ApplicationController
  before_filter :logo_message
  before_filter :type_search
  def index
    @shop = ShopInfos.find_by_id(params[:id])
  end

end
