class PostsController < ApplicationController
  before_action :find_group
  before_action :login_required
  before_action :member_required, :only => [:new, :create]


  # GET /posts/new
  def new
    @post = @group.posts.build
  end

  # GET /posts/1/edit
  def edit
  	@post = current_user.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @group.posts.new(post_params)
    @post.author = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to group_path(@group), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
  	@post = current_user.posts.find(params[:id])
  	
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to group_path(@group), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
  	@post = current_user.posts.find(params[:id])
  	
    @post.destroy
    respond_to do |format|
      format.html { redirect_to group_path(@group), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  	def find_group
  		@group = Group.find(params[:group_id])
  	end
  	
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :image)
    end
    
    def member_required
    	if !current_user.is_member_of?(@group)
    		flash[:warning] = "You are not member of this group!"
    		redirect_to group_path(@group)
    	end
    end
end
