# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :cellphone, :birthdate, :email
end
