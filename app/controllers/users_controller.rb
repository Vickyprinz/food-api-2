class UsersController < ApplicationController
    before_action :authorize, only: [:show, :update, :destroy]

# Handle ActiveRecord Not Found exception
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # get all users /users
    def index
        users = User.all
        render json: users, include: :orders
    end

    # GET /users/:id
    def show
        user = User.find(session[:user_id])
        render json: user, status: :ok
    end

    #POST /users
    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # PUT/ PATCH /users/:id
    def update
        user = User.find(params[:id])
        if user
            User.update(user_params)
            render json: user, status: :created
        else
            render json: { error: "User not found" }, status: :unprocessable_entity
        end
    end

    # DELETE /USERS/:id
    def destroy
        user = User.find(params[:id])
        if user 
            user.destroy 
            head :no_content
        else
            render json: { error: "User not found" }, status: :not_found
        end
    end

    # UPDATE /Password/:id
    def change_password
        user = User.find(params[:id])
        if user && user.authenticate(params[:current_password])
            user.update(password: params[:new_password])
            render json: { message: 'Password updated succesfully'}, status: :ok
        else
            render json: { error: 'Invalid current password' }, status: :unprocessable_entity
        end
    end

    private

    # errors
    def render_not_found_response
        render json: {errors: "User not found"}, status: :not_found
    end
    
    def user_params
        params.permit(:username, :email, :password)
    end

end

