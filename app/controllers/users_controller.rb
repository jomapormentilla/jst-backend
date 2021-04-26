class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all
        render json: UserSerializer.new(users).to_serialized_json
    end

    def profile
        render json: UserSerializer.new(current_user).to_serialized_json
    end

    def create
        user = User.create(user_params)

        if user.valid?
            token = encode_token(user_id: user.id)
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
            render json: { error: 'Failed to create user.' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :email,
            :password,
            :account_type,
            :status,
            :job_search_start_date
        )
    end
end
