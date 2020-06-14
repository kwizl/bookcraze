module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:id])
  end

  def vote_btn(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('Downvote!', article_vote_path(id: vote.id, article_id: article.id), method: :delete)
    else
      link_to('Vote!', article_votes_path(article_id: article.id), method: :post)
    end
  end
end
