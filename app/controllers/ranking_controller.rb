class RankingController < ApplicationController
  before_action :ranking
  def ranking
    article_ids = Good.group(:article_id).order('count_article_id').limit(5).count(:article_id).keys
    @ranking = article_ids.map{|id| Article.find(id)}
  end
end
