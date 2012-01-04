# encoding: utf-8
class Contact < ActiveRecord::Base

  #CONTACT_TYPES = [["指定なし",0],["掲載に関するお問い合わせ",1],["その他",2]]
  #PUB_PLANS = [["無料プラン",0],["ヘッドバナープラン",1],["TOPバナープラン",2],["ライトナビバナープラン",3],["女の子バナープラン",4],["テキストリンクプラン",5],["地域バナープラン",6],["特に決まっていない",7]]
  #validates :contact_type, inclusion: CONTACT_TYPES
  #validates :plans, inclusion: PUB_PLANS

  CONTACT_TYPES = ["指定なし","掲載に関するお問い合わせ","その他"]
  PUB_PLANS = ["無料プラン","ヘッドバナープラン","TOPバナープラン","ライトナビバナープラン","女の子バナープラン","テキストリンクプラン","地域バナープラン","特に決まっていない"]

  validates :email, :presence => true, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :content,:presence => true

end
