class RankingController < ApplicationController
  before_action :ranking
  def ranking
    article_ids = Good.group(:article_id).order('count_article_id DESC').limit(5).count(:article_id).keys
    @good_ranking = article_ids.map{|id| Article.find(id)}

    tag_ids = ArticleTag.group(:tag_id).order('count_tag_id DESC').limit(5).count(:tag_id).keys
    @tag_ranking = tag_ids.map{|id| Tag.find(id)}
  end
end
