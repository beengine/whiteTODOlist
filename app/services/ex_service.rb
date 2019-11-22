require 'digest'
require 'net/http'

class ExService
  MERCHANT_ID = ENV['SAFECHARGE_MERCHANT_ID']
  MERCHANT_SITE_ID = ENV['SAFECHARGE_SITE_ID']
  MERCHANT_SECRET_KEY = ENV['SAFECAHRGE_SECRET_KEY']

  def initialize(user)
    @user = user
  end

  def open_order
    params = {
      merchantId: MERCHANT_ID,
      merchantSiteId: MERCHANT_SITE_ID,
      userTokenId: @user.id,
      clientUniqueId: @user.generate_client_id,
      clientRequestId: client_request_id,
      currency: 'USD',
      timeStamp: timestamp,
      amount: 100,
      checksum: checksum
    }
    puts params.stringify_keys
    request params.stringify_keys
  end

  def checksum

    golf = Digest::MD5.hexdigest MERCHANT_ID + MERCHANT_SITE_ID + client_request_id + '100' + 'USD' + timestamp + MERCHANT_SECRET_KEY
    puts golf 
    golf
  end

  def timestamp
    @timestamp ||= Time.now.strftime('%Y%M%d%H%M%S')
  end

  def client_request_id
    @client_request_id ||= @user.generate_client_request_id
  end

  def request(params)
    url = URI('https://secure.safecharge.com/ppp/api/v1/openOrder.do')
    res = Net::HTTP::post_form(url, params)
    puts res.body
  end
end
