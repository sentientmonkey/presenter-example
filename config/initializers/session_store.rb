# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_presenter-example_session',
  :secret      => '69a3bf06dd5c92b6b811ac03cc3e119c02bf29ada5b22c6abd049822a8b7e834f48b92398958cdcd6eb843674ebaf55308b01a618efe8a15e8c202cbf6926620'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
