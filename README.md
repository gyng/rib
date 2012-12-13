# rib

rib is a basic Futaba-style Rails imageboard.<br>
Contributions and improvements are welcome.

## Features
* Multiple boards (with discussion limit and aged discussion pruning)
* Per-board, posts and discussions catalogs
* Inline image expansion
* Post quoting with backquotes
* Admin interface with post reporting

### To-do
* Text quotes (>quoted text)
* Periodic, automatic discussion update
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

4. Deploy using Apache/nginx, MySQL and Phusion Passenger (https://www.phusionpassenger.com/)
or just test rib by running `rails server`.<br>
See http://rubyonrails.org/deploy for more details.

5. Run `rails runner script/create_admin.rb` to create an admin account. Login page is located at `<site url>/login`.

6. Admin actions are in italics. The Admin toolbox is located at the bottom of every page.

7. Configuration options (reply limit, max discussions per board) are located in `/config/config.yml`.

## rib Uses
### CSS boilerplate
* Skeleton (http://www.getskeleton.com/) (MIT License available in vendor/assets/stylesheets)

### Non-standard gems
Installed with `bundle install`
* paperclip
* will_paginate