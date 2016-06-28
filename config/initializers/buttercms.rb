require 'buttercms-ruby'

# If you added the Heroku Butter add-on, ENV["BUTTER_TOKEN"] will be defined.
# Otherwise, grab your token at https://buttercms.com/profile/ and either set it below
# or in an environment variable.
ButterCMS::api_token = ENV['BUTTER_TOKEN'] || "0fd4f1d43b995529c135e0334174b4fae6539027"