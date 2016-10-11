class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :edit, :update, :destroy]
	# The name of this action has to be the same as the view it links to.
	# This view is called index.html.erb
	def index
		# Get all messages
		@messages = Message.all.order("created_at DESC")
	end

	def show
		# Pointer to template (view)
	end

	def new
		# @message is an instance variable. This means @message is available to our view files.
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)

		# If message was saved successfully, redirect
		# If we don't do this, we get template error for create.html.erb, which does not exist
		
		if @message.save
			# Redirect to messages/index.html.erb
			redirect_to root_path
		else
			# Show the form again
			render 'new'
		end
	end

	def edit
		# Pointer to template (view)
	end

	def update
		if @message.update(message_params)
			# Redirect to messages/index.html.erb
			redirect_to message_path
		else
			# Show the form again
			render 'edit'
		end
	end

	def destroy
		@message.destroy
		redirect_to root_path
	end

	private
	def message_params
		# points to model
		params.require(:message).permit(:title, :description)
	end

	def find_message
		# Get id from querystring and find the message
		@message = Message.find(params[:id])
	end
end
