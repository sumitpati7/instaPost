# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :string
#  caption    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
end
