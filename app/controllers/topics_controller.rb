class TopicsController < ApplicationController
    def index
        @topics = Topic.all
    end
    
    def show
        @topic = Topic.find(params[:id])
    end
    
    def new
        @topic = Topic.new
    end
    
    def create
        @topic = Topic.new
        @topic.name = params[:topic][:name]
        @topic.description = params[:topic][:description]
        @topic.public = params[:topic][:public]
        
        if @topic.save
            redirect_to @topic, notice: "Topic was saved successfully."
        else
            flash[:error] = "There was a problem creating the topic. Please try again."
            render :new
        end
    end
    
    def edit
        @topic = Topic.find(params[:id])
    end
    
    def update
        @topic = Topic.find(params[:id])
        @topic.name = params[:topic][:name]
        @topic.description = params[:topic][:description]
        @topic.public = params[:topic][:public]
        
        if @topic.save
            redirect_to @topic, notice: "Topic was saved successfully."
        else
            flash[:error] = "There was a problem creating the topic. Please try again."
            render :edit
        end
    end
    
    def destroy
        @topic = Topic.find(params[:id])
        if @topic.destroy
            flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
            redirect_to action: :index
        else
            flash[:error] = "There was a problem deleting the topic. Please try again."
            render :show
        end
    end
end
