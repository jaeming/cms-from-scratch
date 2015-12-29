class Admin::TagsController < Admin::DashboardController
  before_action :authorize_user
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create!(tag_params)
    flash[:notice] = "Tag Created"
    redirect_to admin_tags_url
  end

  def edit
  end

  def update
    @tag.update!(tag_params)
    flash[:notice] = "Tag Updated"
    redirect_to admin_tags_url
  end

  def destroy
    @tag.destroy!
    flash[:notice] = "Tag Destroyed"
    redirect_to admin_tags_url
  end

  private

    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:topic)
    end

end
