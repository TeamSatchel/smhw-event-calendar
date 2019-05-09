# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  description :text             not null
#  start_date  :date
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :start_date, :end_date
end
