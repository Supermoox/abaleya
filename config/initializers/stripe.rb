Rails.configuration.stripe = {
  :publishable_key => 'pk_test_czQ9aIlM57GBGPg75ATMD0SS',
  :secret_key      => 'sk_test_908rCVzLFnJpb8XyPFsb5vqC'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

