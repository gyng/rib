class PostLinksController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]
  # GET /post_links
  # GET /post_links.json
  def index
    @post_links = PostLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post_links }
    end
  end

  # GET /post_links/1
  # GET /post_links/1.json
  def show
    @post_link = PostLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post_link }
    end
  end

  # GET /post_links/new
  # GET /post_links/new.json
  def new
    @post_link = PostLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post_link }
    end
  end

  # GET /post_links/1/edit
  def edit
    @post_link = PostLink.find(params[:id])
  end

  # POST /post_links
  # POST /post_links.json
  def create
    @post_link = PostLink.new(params[:post_link])

    respond_to do |format|
      if @post_link.save
        format.html { redirect_to @post_link, notice: 'Post link was successfully created.' }
        format.json { render json: @post_link, status: :created, location: @post_link }
      else
        format.html { render action: "new" }
        format.json { render json: @post_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /post_links/1
  # PUT /post_links/1.json
  def update
    @post_link = PostLink.find(params[:id])

    respond_to do |format|
      if @post_link.update_attributes(params[:post_link])
        format.html { redirect_to @post_link, notice: 'Post link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_links/1
  # DELETE /post_links/1.json
  def destroy
    @post_link = PostLink.find(params[:id])
    @post_link.destroy

    respond_to do |format|
      format.html { redirect_to post_links_url }
      format.json { head :no_content }
    end
  end
end
