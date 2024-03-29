# frozen_string_literal: true

class JsonWebToken
  class << self
    def encode(payload, exp = 1.month.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]

      HashWithIndifferentAccess.new(body)
    rescue StandardError
      nil
    end
  end
end
