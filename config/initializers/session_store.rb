# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_corporate_mixer_session',
  :secret      => 'aa8bc7ec4ca7335597a43cd175d4fca757b4b8a8fb01a3290a99753c1d99ae89cb983d5d35060583b9737aab9b359c553b1ee35f711066ba9604c27da8878f88'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
