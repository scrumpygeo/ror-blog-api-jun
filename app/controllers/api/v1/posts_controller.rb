class Api::V1::PostsController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_post, only: [:show, :update, :destroy]

    def index
      @posts = policy_scope(Post)
    end

    def show 
    end

    def create 
        @post = Post.new(post_params)
        @post.user = current_user
        authorize @post
        if @post.save 
            render :show, status: :created 
            #  status: :created specifies code 201 - not really necessary
        else
            render_error
        end
    end

    def update 
        if @post.update(post_params)
            render :show
        else
            render_error
        end
    end

    def destroy
        @post.destroy
        head :no_content
        # send no body, just head with no_content in it, ie 204
    end

    private

    def set_post
        @post = Post.find(params[:id])
        authorize @post
    end

    def post_params
        params.require(:post).permit(:title, :categories, :content)
    end

    def render_error
        render json: { errors: @post.errors.full_messages },
        status: :unprocessable_entity
    end
  end