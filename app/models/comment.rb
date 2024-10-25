class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create_commit { broadcast_prepend_to('comments') }

  default_scope { order(created_at: :desc ) }
end
