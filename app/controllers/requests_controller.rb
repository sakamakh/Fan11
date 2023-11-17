class RequestsController < ApplicationController
  def index
    # @requests = Request.all
    @requests = "Hello"
  end

  def show
  end

  def new
    # @requests = Request.new
    @categories = Match.distinct.pluck(:category)
    logger.debug("get_match_categoriesに入りました")
  end

  def get_match_categories
    # Ajaxリクエストから送信されたカテゴリを取得
    category = params[:category_select]
    logger.debug("get_match_categoriesに入りました")
    # 選択されたカテゴリに基づいて試合情報を取得
    # @matches = Match.where(category: category)

    # 部分ビューを使って試合日時を表示
    # render partial: 'categories', locals: { matches: @matches }
  end

  # def search
  #   logger.debug("searchの中に入りました")
  # end
end
