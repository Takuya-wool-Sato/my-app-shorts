class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  include LinkPreviewHelper

  # GET /posts or /posts.json
  def index
    @categories = Category.where(user_id: current_user.id)
    if params[:category].present?
      @posts = current_user.posts.where(category_id: params[:category]).order("RAND()")
    else
      @posts = current_user.posts.order("RAND()").all
    end
    # @posts = current_user.posts.order("RANDOM()").all
    @post = Post.new
  end

  # GET /posts or /posts.json
  def list
    @posts = current_user.posts.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @categories = Category.where(user_id: current_user.id)
  end

  # GET /posts/1/edit
  def edit
    @categories = Category.where(user_id: current_user.id)
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)
    @metadata = fetch_metadata(@post.url) if @post.url.present?
    @post.image_url = @metadata[:image_url] if @metadata.present?
    @post.meta_title = @metadata[:title] if @metadata.present?
    @post.meta_description = @metadata[:description] if @metadata.present?
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post.assign_attributes(post_params)
    @metadata = fetch_metadata(@post.url) if @post.url.present?
    @post.image_url = @metadata[:image_url] if @metadata.present?
    @post.meta_title = @metadata[:title] if @metadata.present?
    @post.meta_description = @metadata[:description] if @metadata.present?
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to list_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :url, :meta_title, :meta_description, :category_id)
    end
end
