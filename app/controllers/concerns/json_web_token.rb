require 'jwt'

module JsonWebToken
  ISSUER = 'https://api.todayontap.com'
  ALGORITHM = 'HS256'

  def encode_jwt(payload)
    header_fields = { alg: 'HS256', typ: 'JWT' }
    payload[:iss] = ISSUER
    payload[:iat] = Time.now.to_i
    payload[:exp] = Time.now.to_i + 2 * 3600
    JWT.encode(payload, jwt_key, ALGORITHM, header_fields)
  end

  def decode_jwt(token)
    JWT.decode(token, jwt_key, true, { iss: ISSUER, verify_iss: true, algorithm: ALGORITHM })
  end

  private

  def jwt_key
    Rails.application.credentials.jwt_key
  end
end
