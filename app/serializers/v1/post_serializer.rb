class V1::PostSerializer < ActiveModel::Serializer
  attributes  :id, :title, :description
  has_many :comments
end
