class StreamsController < ApplicationController
  before_action :set_stream, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_search
  
  # GET /streams
  # GET /streams.json
  def index
    
    #@q = Stream.ransack(params[:q])
    #@streams = @q.result(distinct: true)
    
    @stream = Stream.new
    @streams = Stream.all.order("created_at DESC")
  end

  # GET /streams/1
  # GET /streams/1.json
  def show
  end

  # GET /streams/new
  def new
    @stream = current_user.streams.build
  end

  # GET /streams/1/edit
  def edit
  end

  # POST /streams
  # POST /streams.json
  def create
    @stream = current_user.streams.build(stream_params)

    respond_to do |format|
      if @stream.save
        format.html { redirect_to root_path, notice: 'Stream was successfully created.' }
        format.json { render :show, status: :created, location: @stream }
      else
        format.html { render :new }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /streams/1
  # PATCH/PUT /streams/1.json
  def update
    respond_to do |format|
      if @stream.update(stream_params)
        format.html { redirect_to @stream, notice: 'Stream was successfully updated.' }
        format.json { render :show, status: :ok, location: @stream }
      else
        format.html { render :edit }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /streams/1
  # DELETE /streams/1.json
  def destroy
    @stream.destroy
    respond_to do |format|
      format.html { redirect_to streams_url, notice: 'Stream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @stream = Stream.find(params[:id])
    @stream.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @stream = Stream.find(params[:id])
    @stream.downvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  def search
    @search = Stream.search(params["q"])
    @search_result = @search.result
    @stream = Stream.new
    @streams = Stream.all.order("created_at DESC")
  end

  def search_page
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stream
      @stream = Stream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stream_params
      params.require(:stream).permit(:stream, :picture)
    end





end











