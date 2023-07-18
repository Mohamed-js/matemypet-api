class UserMailer < ApplicationMailer
    default from: "registrations@matemypet.com"

    def welcome_email
        @email = params[:email]
        @otp  = params[:otp]
        mail(to: @email, subject: 'Welcome to Mate My Pet')
    end
end
