class Message < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message.hello.subject
  #
 default from: "saniconico@gmail.com"
  
  def regestration_mail(user)
    @user = user
    mail(
         to: user.email,
         subject: "ユーザー登録完了のお知らせ"
    )
  end
end
