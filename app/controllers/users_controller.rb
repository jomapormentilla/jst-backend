class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: UserSerializer.new(current_user).to_serialized_json
    end
end
