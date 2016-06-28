class GroupsController < ApplicationController

  layout 'application'

  before_action :login_required, except: [:index, :show]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all.includes(:owner)
    
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  	@group = Group.find(params[:id])
  	@posts = @group.posts.includes(:author)
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  	@group = current_user.groups.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    	
    @group = current_user.groups.build(group_params)

    respond_to do |format|
      if @group.save
            	
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
  	@group = current_user.groups.find(params[:id])

    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_path(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
  	@group = current_user.groups.find(params[:id])

    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_path, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def join
  	@group = Group.find(params[:id])
  	
  	if !current_user.is_member_of?(@group)
  		current_user.join!(@group)
  	else
  		flash[:warning] = "You already joined this group!"
  	end
  	redirect_to group_path(@group)
  	
  end
  
  def quit
  	@group = Group.find(params[:id])
  	
  	if current_user.is_member_of?(@group)
  		current_user.quit!(@group)
  	else
  		flash[:warning] = "You are not member of this group!"
  	end
  	redirect_to group_path(@group)

  end

  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    #「Strong Parameters 的作法」
    def group_params
      params.require(:group).permit(:title, :description, :image)
    end
end
