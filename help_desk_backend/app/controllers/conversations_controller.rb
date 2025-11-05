class ConversationsController < ApplicationController
  # All actions require JWT authentication via Authenticatable concern
  # JWT token should be provided in Authorization header: "Bearer <token>"
  # The @current_user is set by Authenticatable#authenticate_user! which uses JwtService.decode
  # Authentication is automatically applied via ApplicationController's inclusion of Authenticatable

    # GET /conversations
    def index
        conversations = Conversation.for_user(@current_user)
        .includes(:initiator, :assigned_expert)
        .order(updated_at: :desc)

        render json: conversations.map { |c| conversation_response(c) }
    end

    # GET /conversations/:id
    def show
        conversation = Conversation.for_user(@current_user).find_by(id: params[:id])

        if conversation
            render json: conversation_response(conversation)
        else
            render json: { error: "Conversation not found" }, status: :not_found
        end
    end

    # POST /conversations
    def create
        conversation = Conversation.new(conversation_params)
        conversation.initiator = @current_user
        conversation.status = "waiting"
        conversation.last_message_at = Time.current

        if conversation.save
            render json: conversation_response(conversation), status: :created
        else
            render json: { errors: conversation.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def conversation_params
        params.permit(:id, :title)
    end
end