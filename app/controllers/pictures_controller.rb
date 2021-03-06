class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def index
    @pictures = Picture.all
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        CreateMailer.send_when_create(@picture).deliver
        redirect_to pictures_path, notice: "投稿しました"
      else
        render :new
      end
    end
  end

  def new
    @picture = Picture.new
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
    @user = @picture.user.id
    if @user != current_user.id
      redirect_to pictures_path
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"削除しました"
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private
  def picture_params
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
