class ArticlesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index , :show, :new , :create  , :update]
  def index
    @articles = Article.all
    if user_signed_in?
      @user = current_user.email
    else
      @user = "No User Is Signed In"

    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @user = User.find(current_user.id)
    @article = @user.articles.create(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy



    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
