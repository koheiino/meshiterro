class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  # 投稿データの保存
  def create
    #フォームに入力されたデータ(shop_name や caption,image など)が、@post_image に格納
    @post_image = PostImage.new(post_image_params)
    #@post_image(投稿データ)のuser_idを、current_user.id(今ログインしているユーザーの ID)に指定することで投稿データに、今ログイン中のユーザーの ID を持たす
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end
  
  private
  
  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
