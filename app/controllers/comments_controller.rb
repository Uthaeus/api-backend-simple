class CommentsController < ApplicationController
    before_action :set_meetup!

    def create
        @comment = @meetup.comments.build(comment_params)
        @comment.user = current_user

        @comment.save!
        render json: @comment, status: :created, location: @meetup, include: [:user]
    end

    private

    def current_user
        @current_user ||= User.find_by!(id: request.headers[:token])
    end

    def set_meetup!
        @meetup = Meetup.find_by!(id: comment_params[:meetup_id])
    end

    def comment_params
        params.require(:comment).permit(:content, :meetup_id)
    end
end
