class UserMailer < BaseMailer

  def setup_account_instructions(user, opts={})
    @user = user
    secure_params = {user_id: user.id}
    @link_params = {data: UrlStore.encode(secure_params)}

    mail(to: user.email, subject: t('user.setup.instructions_email_subject'))
  end

  def confirmation_instructions(user, token, opts={})
    @token = token
    @user = user
    mail(to: user.email, subject: t('user.confirmation.instructions_email_subject'))
  end

  def reset_password_instructions(user, token, opts={})
    @user = user
    @token = token

    mail(to: user.email, subject: t('user.password_change.instructions_email_subject'))
  end

end