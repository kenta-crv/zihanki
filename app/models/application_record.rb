class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Ransack 4 以降は明示的な allowlist が必須
  def self.ransackable_attributes(auth_object = nil)
    authorizable_ransackable_attributes
  end

  def self.ransackable_associations(auth_object = nil)
    authorizable_ransackable_associations
  end
end
