class MessagesController < ApplicationController

  def send_new_contact_form_message
    @message = Message.new(message_params)

    if @message.save
      redirect_to :back
    end
  end


  private

    def message_params
      params.require(:message).permit(:email, :phone, :question, :status)
    end

end
