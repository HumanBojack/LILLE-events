class CommentsController < ApplicationController
	def create
		comment = Comment.new(params_comments)
		comment.event = Event.find(params[:event_id])
		comment.user = current_user
		if comment.save
			flash.notice = "Comment successfully created"
			redirect_to comment.event
		else
			flash.error = comment.errors.full_messages.to_sentence
			redirect_to comment.event
		end
	end


	private
	def params_comments
		params.require(:comment).permit(:content)
	end
end
