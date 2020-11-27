# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :id, :name, :last_name, :cellphone, :birthdate, :email
end
