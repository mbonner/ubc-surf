class AddUbcsurfUser < ActiveRecord::Migration
  def self.up
		#Be sure to change these settings for your initial admin user
    user = SiteUser.new
		user.login = "ubcsurf"
		user.email = "ubcsurfclub@gmail.com"
		user.password = "l0ngbeac8"
		user.password_confirmation = "l0ngbeac8"
    user.save(false)
		surf_user = SiteUser.find_by_login("ubcsurf")
		admin_role = Role.find_by_name("admin")
		surf_user.activated_at = Time.now.utc
		surf_user.roles << admin_role
    surf_user.save(false)   
		
		# lets disable admin user
		admin_user = User.find_by_login("admin")
		admin_user.enabled = false
		admin_user.save(false)
  end

  def self.down
		admin_user = User.find_by_login("ubcsurf")
		admin_role = Role.find_by_name("admin")
		admin_user.roles = []
    admin_user.save
    admin_user.destroy
		admin_role.destroy
  end
end
