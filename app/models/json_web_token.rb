class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, ENV.fetch('JWT_SECRET_KEY', nil), 'HS256')
  end

  def self.decode(token)
    JWT.decode(token, ENV.fetch('JWT_SECRET_KEY', nil), true, algorithm: 'HS256').first
  end
end
