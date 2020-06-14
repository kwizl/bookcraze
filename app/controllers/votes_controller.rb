class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(post_id: params[:post_id])

    if @Vote.save
      redirect_to articles_path, notice: 'You voted an article.'
    else
      redirect_to articles_path, alert: 'You cannot vote this article.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, post_id: params[:post_id])
    if vote
      vote.destroy
      redirect_to articlesposts_path, notice: 'You unvoted an article.'
    else
      redirect_to articles_path, alert: 'You cannot disvote an article that you did not vote before.'
    end
  end
end
