class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :charge, class_name: 'User', foreign_key: 'charge_id'

  validates :title, presence: true
  
  enum status: {未着手:0, 対応中:1, 完了:2}
end
