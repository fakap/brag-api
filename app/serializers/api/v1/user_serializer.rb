class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :first_name, :last_name, :user_name, :email, :created_at
end
