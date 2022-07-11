class Project < ApplicationRecord
  has_one :repository, dependent: :destroy
  has_one :site, dependent:  :destroy

  def to_s
    " id => #{id}, name => #{name}, repository => #{repository.to_s}"
  end

end
