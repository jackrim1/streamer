class SearchController < ApplicationController\
	before_action :set_search
	
	def index
    @q = Stream.ransack(params[:q])
    @streams = @q.result(distinct: true)
    #@streams = Stream.all.order("created_at DESC")
  	end


  private


end
