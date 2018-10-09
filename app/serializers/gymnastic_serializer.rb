class GymnasticSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :location
  has_one :user
end
