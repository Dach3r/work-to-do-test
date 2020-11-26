# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include ConstantHelper

  self.abstract_class = true
end
