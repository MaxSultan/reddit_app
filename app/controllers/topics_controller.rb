class TopicsController < ApplicationController
  before_action :set_sub
  before_action :set_topic, only: [:show, :edit, :destroy, :update]

  def index
    @topics = @sub.topics
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    render partial: "form"
  end

  def new
    @topic = @sub.topics.new
    render partial: "form"
  end

  def create
    @topic = @sub.new(topic_params)

    if @topic.save
      redirect_to [@sub, @topic]
    else
      render :new
    end
  end 

  def update
    if @topic.update(topic_params)
      redirect_to [@sub, @topic]
    else
      render :edit
    end
  end 

  def destroy
    @topic.destroy
    redirect_to sub_topics_path(@sub)
  end 

  private

  def set_sub
    @sub = Sub.find(params[:sub_id])
  end

  def topic_params
    params.require(:topic).permit(:name, :body)
  end 

  def set_topic
    @topic = Topic.find(params[:id])
  end 
end
