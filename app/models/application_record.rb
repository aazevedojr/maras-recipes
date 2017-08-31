class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def unsaved?
    !persisted?
  end
end
