class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:edit, :update, :destroy]


  def index
    @topics = Topic.all
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
    redirect_to topics_path, notice: "トピックを作成しました！"
    else
      render 'new'
    end
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def show
  end

  def update
    if @topic.update(topics_params)
      redirect_to topics_path, notice: "トピックを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "トピックを削除しました！"
  end

  private
      def topics_params
        params.require(:topic).permit(:title, :content)
      end

      def set_topic
           @topic = Topic.find(params[:id])
         end

end
