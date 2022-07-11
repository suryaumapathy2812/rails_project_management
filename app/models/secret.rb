class Secret < ApplicationRecord
  belongs_to :provider, :foreign_key => :provider_id
  belongs_to :user, :foreign_key => :user_id


  def to_s
    "Secret: id => #{self.id}  provider => #{self.provider_id} user => #{self.user_id}token=> #{self.token} client_id => #{self.client_id} client_secret => #{self.client_secret}"
  end

end
