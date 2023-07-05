class ContactController < ActionController::Base
  layout 'application'

  def index
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: 'Mensaje enviado correctamente.'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:nombre, :email, :mensaje)
  end
end
