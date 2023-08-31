# frozen_string_literal: true

class Harvest < ApplicationRecord
  validates :date, :weight, presence: true
  validates :weight, numericality: true

  belongs_to :hive
end
