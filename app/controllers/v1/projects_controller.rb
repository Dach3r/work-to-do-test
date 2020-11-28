# frozen_string_literal: true

module V1
  class ProjectsController < ApplicationController
    before_action :set_project, only: %w[show update pending users add_user]
    before_action :authenticate_user!

    def create
      project = @user.projects.create!(project_params)
      render json: project
    rescue StandardError => e
      default_error(e)
    end

    def show
      render json: @project
    rescue StandardError => e
      default_error(e)
    end

    def pending
      tasks = @project.tasks.pending_board
      render json: tasks
    rescue StandardError => e
      default_error(e)
    end

    def update
      @project.update!(project_params)
      render json: @project
    rescue StandardError => e
      default_error(e)
    end

    def users
      projects = @project.users
      render json: projects
    rescue StandardError => e
      default_error(e)
    end

    def add_user
      raise I18n.t('activerecord.models.project.unauthorized') if @user&.id != @project.user.id
      raise I18n.t('activerecord.models.user.not_found') if params[:email].blank?

      user = User.find_by(email: params[:email])
      raise I18n.t('activerecord.models.user.not_found') if user.blank?
      raise I18n.t('activerecord.models.project.not_permit_owner') if user.id == @project.user.id

      ProjectUser.create!(user: user, project: @project)
      default_success(I18n.t('activerecord.models.project.success_invitation', email: user.email))
    rescue StandardError => e
      default_error(e)
    end

    private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.permit(:name, :description, :due_date)
    end
  end
end
