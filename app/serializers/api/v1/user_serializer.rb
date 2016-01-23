class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :first_name, :last_name, :username, :created_at
end
