class RedditsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_stream
	before_action :set_reddit, only: [:show]

	def new
		@reddit = @stream.reddits.build
	end

	def show

	end

	def create
		@reddit = @stream.reddits.build(reddit_params)

		respond_to do |format|
			if @reddit.save
				format.html { redirect_to @stream}
			else
				format.html { render json: @reddit.errors, status: :unprocessable_entity}
			end
		end
	end

	private

	def reddit_params
		params.require(:reddit).permit(:reddit, :stream_id, :user)
	end

	def set_reddit
		@reddit = Reddit.find(params[:id])
	end

	def set_stream
		@stream = Stream.find(params[:stream_id])
	end


end