class Api::V1::CommentSerializer < Api::V1::BaseSerializer
  attributes :id, :user_id, :brag_id, :text
end
