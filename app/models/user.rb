# frozen_string_literal: true

class User < ApplicationRecord
  has_many :elections
  has_many :audits
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
