class PagesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :set_search
	
	def index
    @q = Stream.ransack(params[:q])
    @streams = @q.result(distinct: true)
    #@streams = Stream.all.order("created_at DESC")
  	end


  private

	def set_stream
      @stream = Stream.find(params[:id])
    end

    def stream_params
      params.require(:stream).permit(:stream, :picture)
    end
end
