class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { "製作不可":0, "製作待ち":1, "製作中":2, "製作完了":3 }


  class << self
    def localed_making_statuses
      making_statuses.keys.map do |s|
        [ApplicationController.helpers.t("making_status.article.#{s}"), s]
      end
    end
  end
end