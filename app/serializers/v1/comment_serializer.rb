class V1::CommentSerializer < ActiveModel::Serializer
  attributes :id, :name, :comment_text, :created_at
  belongs_to :post
end
