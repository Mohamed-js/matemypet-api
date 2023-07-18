module UsersHelper
    def tokenize!(user, attempts = 10)
        retries ||= 0
        user.token = SecureRandom.urlsafe_base64(nil, false) + "(*)" + DateTime.now.to_s
        user.save!
      rescue ActiveRecord::RecordNotUnique => e
        raise if (retries += 1) > attempts
    
        Rails.logger.warn("random token, unlikely collision number #{retries}")
        user.token = SecureRandom.urlsafe_base64(16, false) + "(*)" + DateTime.now.to_s
        retry
    end

    def create_otp user
      user.otp_code = rand(1000..9999)
      user.save

      UserMailer.with(email: user.email, otp: user.otp_code).welcome_email.deliver_later
    end
end
