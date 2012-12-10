# rib

rib is a basic Futaba-style Rails imageboard.<br>
Contributions and improvements are welcome.

## Features
* Multiple boards, with discussion limit and aged discussion pruning
* Inline image expansion
* Post quoting
* Admin interface with post reporting

### To-do
* Backquotes
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

4. Deploy using Apache/nginx, MySQL and Phusion Passenger (https://www.phusionpassenger.com/) or just use Webrick + sqlite by running `rails server`.
See http://rubyonrails.org/deploy for more details

5. Run `rails runner script/create_admin.rb` to create an admin account. Login page is located at `<site url>/login`.

6. Admin actions are in italics. The Admin toolbox is located at the bottom of every page.

## rib Uses
### CSS Boilerplate
* Skeleton (http://www.getskeleton.com/) (MIT License available in vendor/assets/stylesheets)

### Non-standard gems
Installed with `bundle install`
* gem paperclip
* gem will_paginate