require 'securerandom'
require 'digest'

class ExService
  include HTTParty

  CONTENT_TYPE = 'application/json; charset=utf8'
  MERCHANT_ID = ENV['SAFECHARGE_MERCHANT_ID']
  MERCHANT_SITE_ID = ENV['SAFECHARGE_SITE_ID']
  MERCHANT_SECRET_KEY = ENV['SAFECAHRGE_SECRET_KEY']
  OPEN_ORDER_URL = 'https://ppp-test.safecharge.com/ppp/api/v1/openOrder.do'
  GET_PAYMENT_PAGE_URL = "https://ppp-test.safecharge.com/ppp/api/v1/getPaymentPageUrl.do"

  headers 'Accept': 'application/json', 'Content-Type': CONTENT_TYPE

  def initialize(user, amount)
    @user = user
    @amount = amount
  end

  def open_order
    params = {
      merchantId: MERCHANT_ID,
      merchantSiteId: MERCHANT_SITE_ID,
      userTokenId: @user.id,
      clientUniqueId: client_unique_id,
      clientRequestId: client_request_id,
      currency: 'USD',
      timeStamp: timestamp,
      amount: @amount,
      checksum: checksum
    }
    request params, OPEN_ORDER_URL
  end

  def get_payment_page_url
    params = {
      merchantId: MERCHANT_ID,
      merchantSiteId: MERCHANT_SITE_ID,
      userTokenId: @user.id,
      clientUniqueId: client_unique_id,
      clientRequestId: client_request_id,
      currency: 'USD',
      timeStamp: timestamp,
      amount: @amount,
      billingAddress: {firstName: 'Toto', lastName: 'Cotugnio', address: 'Sweet Street 1, San Francisco, CA, US', cell: '+16191231234', phone: "+16141231234", zip: '123210', city: 'Los Angeles', country: 'US', state: 'CA', email: 'gfdsf@dfg.com', county: ''},
      checksum: checksum
    }
    request params, GET_PAYMENT_PAGE_URL
  end

  def checksum
    Digest::SHA2.new(256).hexdigest(MERCHANT_ID +
                                    MERCHANT_SITE_ID +
                                    client_request_id +
                                    @amount.to_s +
                                    'USD' +
                                    timestamp +
                                    MERCHANT_SECRET_KEY)
  end

  def timestamp
    @timestamp ||= Time.now.strftime('%Y%m%d%H%M%S')
  end

  def client_request_id
    @client_request_id ||= SecureRandom.hex
  end

  def client_unique_id
    @client_unique_id ||= SecureRandom.hex
  end

  def request(params, url)
    res = self.class.post(url, body: params.to_json)
    @response =  JSON.parse res.body
    puts @response
    @response['sessionToken']
  end
end
