#coding:utf-8
class UserMailer < ActionMailer::Base
	helper :application

  def order_confirmation(order)
    @order=order
    mail(to:order.email, subject:"Подтверждение заказа", from:Settings.owner_email)
  end
  def new_order(order)
    @order=order
    mail(to:Settings.owner_email, subject:"Новый заказ", from:order.email)
  end
end
