class MembersOnlyArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :authenticate_user!
  def index
    if current_user
      render json: Article.all # Or any other code to return the members-only articles data
    else
      render json: { error: "You must be signed in to access this resource" }, status: :unauthorized
    end
  end

  def show
    if current_user
      render json: Article.find(params[:id]) # Or any other code to return the members-only article data
    else
      render json: { error: "You must be signed in to access this resource" }, status: :unauthorized
    end
  end

  private

  def record_not_found
    render json: { error: "Article not found" }, status: :not_found
  end

end
