module Api 
  module V1
    class TodosController < ApplicationController
      AllowedData = %[:title, :description, :duration].freeze
      def index
        todos = Todo.all
        render json: todos
      end

      def show
        todo = Todo.find(params[:id])
        render json: todo
      end

      def create
        data = json_payload.select{|k| AllowedData.include?(k)}
        todo = Todo.new(data)
        if todo.save
          render json: todo
        else
          render json: todo.errors, status: :unprocessable_entity
      end

  end
  
  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
  end
  end
end
end
