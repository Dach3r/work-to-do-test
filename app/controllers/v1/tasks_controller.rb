# frozen_string_literal: true

module V1
  class TasksController < ApplicationController
    before_action :set_task, only: %w[show update update_status]
    before_action :set_project, only: %w[index show]
    before_action :authenticate_user!, only: %w[create update update_status]

    def index
      tasks = @project.tasks

      if @project.project_users.find_by(user_id: @user.id).present? || @user.id == @project.user.id
        render json: tasks
      else
        render json: tasks, each_serializer: Tasks::TaskPublicSerializer
      end
    rescue StandardError => e
      default_error(e)
    end

    def show
      if @project.project_users.find_by(user_id: @user.id).present? || @user.id == @project.user.id
        render json: @task
      else
        render json: @task, serializer: Tasks::TaskPublicSerializer
      end
    rescue StandardError => e
      default_error(e)
    end

    def create
      task = @user.tasks.new(task_params)
      task.project_id = params[:project_id]
      render json: task if task.save!
    rescue StandardError => e
      default_error(e)
    end

    def update
      @task.update!(task_params)
      render json: @task
    rescue StandardError => e
      default_error(e)
    end

    def update_status
      status = params[:status]
      render json: @task if @task.update!(status: status)
    rescue StandardError => e
      default_error(e)
    end

    private

    def set_task
      @task = Task.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def task_params
      params.permit(:name, :description, :position, :priority)
    end
  end
end
