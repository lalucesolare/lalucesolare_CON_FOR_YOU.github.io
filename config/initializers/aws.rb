CarrierWave.configure do |config|
  
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     '',                        # required unless using use_iam_profile
    aws_secret_access_key: '',                        # required unless using use_iam_profile
    # use_iam_profile:       true,                         # optional, defaults to false
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
   
    endpoint:              'https://s3-ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'vacabucket'                                      # required
  config.fog_public     = true                                                 # optional, defaults to true
  config.fog_attributes = {} # optional, defaults to {}
end