class Repository < ApplicationRecord
  belongs_to :project


  def to_s
    " id => #{id}, name => #{name}, path => #{path}, project_id => #{project_id}"
  end


end
