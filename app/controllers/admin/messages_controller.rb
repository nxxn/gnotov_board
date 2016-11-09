class Admin::MessagesController < AdminController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message
    else

    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)
    redirect_to message_path(@message)
  end

  def destroy

  end

  protected

  def message_params
    params.require(:message).permit(:email, :phone, :question, :status)
  end

end
