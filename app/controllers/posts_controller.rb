class PostsController < ApplicationController
  skip_before_filter :authorize, only: [:show, :new, :create, :flag, :index, :poll]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate page: params[:page], order: 'created_at desc', per_page: 21

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def poll
    @posts = Post.where("discussion_id = ? AND id > ?", params[:discussion_id], params[:after])

    unless @posts.empty?
      @post_count = @posts.count
      @last_post_at = @posts.last.created_at
    end
  end

  def flagged
    @posts = Post.where(flagged: true).paginate page: params[:page], order: 'created_at desc', per_page: 21

    respond_to do |format|
      format.html # flagged.html.erb
      format.json { render json: @posts }
    end
  end

  def flag
    @post = Post.find(params[:id])
    @post.flagged = true

    respond_to do |format|
      if @post.save
        format.html { redirect_to :back, notice: 'Post was flagged.' }
        format.json { render json: @post, status: :flagged, location: @post }
      else
        format.html { render action: "flag" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def unflag
    @post = Post.find(params[:id])
    @post.flagged = false

    respond_to do |format|
      if @post.save
        format.html { redirect_to :back, notice: 'Post was unflagged.' }
        format.json { render json: @post, status: :flagged, location: @post }
      else
        format.html { render action: "unflag" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to :back, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to :back, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'Post not updated.' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
