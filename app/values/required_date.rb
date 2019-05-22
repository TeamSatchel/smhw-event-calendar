# frozen_string_literal: true

class RequiredDate
  include ActiveModel::Validations
  attr_reader :date
  validates_presence_of :date

  def blank?
    @date.nil?
  end

  private

  def initialize( date )
    @date = DateTime.parse( date.to_s )
  rescue ArgumentError
    @date = nil
  end
end
