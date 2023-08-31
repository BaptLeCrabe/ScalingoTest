# frozen_string_literal: true

class Hive < ApplicationRecord
  validates :name, :weight, presence: true
  validates :name, length: { minimum: 6 }
  validates :weight, numericality: true

  mount_uploader :picture, ImageUploader
  has_many :harvests, dependent: :destroy
end
