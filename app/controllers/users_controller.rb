class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all
        render json: UserSerializer.new(users).to_serialized_json
    end

    def profile
        render json: UserSerializer.new(current_user).to_serialized_json
    end

    def show
        user = User.find_by(id: params[:id])

        if !!user
            render json: UserSerializer.new(user).to_serialized_json
        else
            render json: { error: "Unable to find user." }
        end
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

    def update
        user = User.find_by(id: params[:id])

        if user.update(user_params)
            render json: UserSerializer.new(user).to_serialized_json
        else
            render json: { error: "Something went wrong: unable to update user." }
        end
    end

    def destroy
        user = User.find_by(id: params[:id])

        if user
            user.destroy
            render json: { message: "User successfully deleted frmo database." }
        else
            render json: { error: "Unable to delete user." }
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
