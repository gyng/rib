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
  * [Ruby with RubyGems (>=1.9)](http://www.ruby-lang.org)
  * [Ruby On Rails 3](http://rubyonrails.org/)
  * [ImageMagick](http://www.imagemagick.org/script/index.php) [(Sourceforge)](http://sourceforge.net/projects/imagemagick/)

2. Clone the repository.

3. Run `bundle install` to install required gems.

4. Deploy or just test rib by running `rails server`. See [Rails' deploy page](http://rubyonrails.org/deploy)

5. Run `rails runner script/create_admin.rb` to create an admin account (Ruby >= 1.9.3).
   * If on a lower version run `rails runner script/create_admin_shown_password.rb` instead.

6. Admin login page is located at `<site url>/login`.<br>
   Admin actions are in italics. The Admin toolbox is located at the bottom of each page.

7. Configuration options (eg. reply limit, max discussions per board) are located in `config/config.yml`.

## rib Uses
### CSS boilerplate
* [Skeleton](http://www.getskeleton.com/) (MIT License located at vendor/assets/stylesheets)

### Non-standard gems
Installed with `bundle install`
* paperclip
* will_paginate

## License
rib is licensed under the MIT License. See [LICENSE.md](LICENSE.md)