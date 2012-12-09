class DiscussionsController < ApplicationController
  require 'will_paginate/array'
  skip_before_filter :authorize, only: [:index, :show, :create, :new, :update]

  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.all.paginate page: params[:page], order: 'last_post_at desc', per_page: 10
    #@discussion = Discussion.new
    #@post = Post.new(discussion: @discussion)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discussions }
    end
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
    @discussion = Discussion.find(params[:id])
    @posts = @discussion.posts

    # Reply form
    @post = Post.new(discussion: @discussion)
    @submit_label = 'Reply'

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discussion }
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to action: 'index', notice: 'Invalid discussion.'
  end

  # GET /discussions/new
  # GET /discussions/new.json
  def new
    @discussion = Discussion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/1/edit
  def edit
    @discussion = Discussion.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = Discussion.new(params[:discussion])

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
        format.json { render json: @discussion, status: :created, location: @discussion }
      else
        format.html { render action: "new" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        format.html { redirect_to @discussion, notice: 'Reply added.' }
        #format.js
        format.json { head :no_content }
      else
        format.html { redirect_to @discussion, notice: 'Invalid post.' }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to discussions_url }
      format.json { head :no_content }
    end
  end
end
