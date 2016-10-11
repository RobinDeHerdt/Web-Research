class MessagesController < ApplicationController
	
	# The name of this action has to be the same as the view it links to.
	# This view is called index.html.erb
	def index

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

	private
	def message_params
		# points to model
		params.require(:message).permit(:title, :description)
	end
end
