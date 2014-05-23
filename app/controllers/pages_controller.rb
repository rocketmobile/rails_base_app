class PagesController < ApplicationController
  def home
    @message = Message.new
  end
  def create
    @message = Message.new(params[:message])

    if @message.valid? && @message.deliver
      redirect_to root_path, notice: 'Message sent!'
    else
      flash.now[:alert] = 'Message not sent.'
      render :home
    end
  end
end