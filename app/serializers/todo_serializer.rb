class TodoSerializer < ActiveModel::Serializer

  # attributes to be serialized
  attributes :id, :title, :created_by, :created_at, :created_by, :deadline

  # association
  has_many :items
end
