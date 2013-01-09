# rib

rib is a basic Futaba-style Rails imageboard.<br>
Contributions and improvements are welcome.

## Features
* Multiple boards (with discussion limit and aged discussion pruning)
* Periodic, automatic discussion updating
* Board catalogs
* Posts and discussions indices
* Single post threaded view
* Inline image expansion
* Post quoting with backquotes
* Admin interface with post reporting

### To-do
* Automatic updating for boards, post thread views
* Text quotes (>quoted text)
* Tests
* Optimisations

## Getting Started

1. Install prerequisites
  * Ruby with RubyGems (>=1.9)<br>
    http://www.ruby-lang.org/en/downloads/
  * Ruby On Rails 3<br>
    http://rubyonrails.org/
  * ImageMagick<br>
    http://www.imagemagick.org/script/index.php <br>
    http://sourceforge.net/projects/imagemagick/

2. Clone the repository.

3. Run `bundle install` to install required gems.

4. Deploy or just test rib by running `rails server`.<br>
See http://rubyonrails.org/deploy for more details.
   * Note: Set line `config.assets.digest = true` in `config/environments/production.rb` to `false` if precompiling assets with `bundle exec rake assets:precompile`. See: http://guides.rubyonrails.org/asset_pipeline.html

5. Run `rails runner script/create_admin.rb` to create an admin account.
   * Note: `create_admin.rb` requires ruby >= 1.9.3 (require 'io/console' for password hiding). If on a lower version run `rails runner script/create_admin_shown_password.rb` instead.

6. Admin login page is located at `<site url>/login`.<br>
   Admin actions are in italics. The Admin toolbox is located at the bottom of each page.

7. Configuration options (eg. reply limit, max discussions per board) are located in `config/config.yml`.

## rib Uses
### CSS boilerplate
* Skeleton (http://www.getskeleton.com/) (MIT License available in vendor/assets/stylesheets)

### Non-standard gems
Installed with `bundle install`
* paperclip
* will_paginate