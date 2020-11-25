# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    default_success('Api rest Work To Do')
  rescue StandardError => e
    default_error(e)
  end
end
