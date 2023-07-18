class UserMailer < ApplicationMailer
    default from: "registrations@matemypet.com"

    def welcome_email
        @user = params[:username]
        @otp  = params[:otp]
        mail(to: "atefhamosa@gmail.com", subject: 'Welcome to My Awesome Site')
    end
end
