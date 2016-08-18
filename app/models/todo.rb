class Todo < ApplicationRecord
  scope :orderde, -> { order("is_finished, created_at desc")}
end
