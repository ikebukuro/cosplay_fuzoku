# encoding: utf-8
class ContactController < ApplicationController
  def index
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(params[:contact])
    unless @contact.valid?
    render :action => "index"
    end
  end

  def finish
    @contact = Contact.new(params[:contact])
    if @contact.save
    ContactNotifier.received(@contact).deliver
    else
    redirect_to action: 'index'
    end
  end
end
