class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :first_name, :last_name, :username, :created_at
end
