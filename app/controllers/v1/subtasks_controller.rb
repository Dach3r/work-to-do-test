# frozen_string_literal: true

module V1
  class SubtasksController < ApplicationController
    before_action :set_task, only: %w[create update]
    before_action :authenticate_user!

    def create
      subtask = @task.subtasks.new(subtask_params)
      subtask.user_id = @user.id
      subtask.project_id = params[:project_id]
      render json: subtask, serializer: Tasks::SubtaskSerializer if subtask.save!
    rescue StandardError => e
      default_error(e)
    end

    private

    def set_task
      @task = Task.find(params[:task_id])
    end

    def subtask_params
      params.permit(:name, :priority)
    end
  end
end
