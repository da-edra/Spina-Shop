module Spina::Shop
  class InStockReminderMailer < ActionMailer::Base
    layout 'spina/shop/mail'

    def reminder(email, orderable)
      @orderable = orderable

      mail(
        to: email,
        from: "#{current_account.name} <#{current_account.email}>",
        subject: t('spina.shop.emails.in_stock_reminder_title')
      )
    end

    private

      def current_account
        Spina::Account.first # Replace with email setting Spina Shop
      end

  end
end