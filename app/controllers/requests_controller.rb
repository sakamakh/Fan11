class RequestsController < ApplicationController
  def index
    # @requests = Request.all
    @posts = Post.all
  end

  def show
  end

  def new
    # binding.pry
    @post = Post.new
    # @categories = Match.distinct.pluck(:category)
  end

  def create
    logger.debug("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    # binding.pry
    # @param = post_params
    
     @post = Post.new(post_params)
    # @post = Post.new(
    #   title: params[:title],
    # )
    if @post.save
      redirect_to requests_path, notice: 'post was succsssfully created.'
    else
      render :new
    end
  end

  def get_match_categories
    # binding.pry
    # Ajaxリクエストから送信されたカテゴリを取得
    logger.debug("ログ出力")
    logger.debug(params[:req][:paramName])
    # binding.pry
    if params[:req][:paramName] == "select_match_date"
      @matches = Match.where(match_date: params[:req][:value1], category: params[:req][:value2])
      # logger.debug("match_date")
    elsif params[:req][:paramName] == "select_match_team"
      @matches = Match.where(id: params[:req][:value])
    elsif params[:req][:paramName] == "select_category"
      @matches = Match.where(category: params[:req][:value])
      # logger.debug("match_date")
    end

    # category = params[:category_select]
    # 選択されたカテゴリに基づいて試合情報を取得
    # @matches = Match.where(category: category)

    # 部分ビューを使って試合日時を表示
    if @matches.size > 0
      render json: @matches
    else
      render json: 'no data'
    end
  end
  
  private
    def post_params
      # binding.pry
      # params.require(:post).permit(:posted_image, :title, :description, :match_date, :select_match, :stadium_name, :max_number, :tichet, :meet_time, :address)
      # params.require(:post).permit(:title, :description)
      params.permit(:title, :description)
    end
end
