class User < ActiveRecord::Base
  attr_accessible :name
  attr_protected :password_digest
  validates :name, presence: true, uniqueness: true
  after_destroy :ensure_an_admin_remains
  has_secure_password

  def ensure_an_admin_remains
    if User.count.zero?
      raise "Cannot delete last user."
    end
  end
end
