# frozen_string_literal: true

module V1
  class TasksController < ApplicationController
    before_action :set_task, only: %w[show update update_status]
    before_action :authenticate_user!, only: %w[create update update_status]

    def index
      project = Project.find(params[:project_id])
      tasks = project.tasks

      if @user.present?
        render json: tasks
      else
        render json: tasks, serializer: Tasks::TaskPublicSerializer
      end
    rescue StandardError => e
      default_error(e)
    end

    def show
      if @user.present? && @user.id == @task.user.id
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
      @task.update!(status: status)
      render json: @task
    rescue StandardError => e
      default_error(e)
    end

    private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.permit(:name, :description, :position, :priority)
    end
  end
end
