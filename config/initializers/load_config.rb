# Be sure to restart your server when you modify this file.

# Loads application configuration settings from /config/config.yml

APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]