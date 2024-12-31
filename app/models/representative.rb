# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []
    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''
      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end
      party_temp = official.party
      photo_temp = official.photo_url
      address_temp = array_concat(official.address)
      rep = Representative.find_or_create_by!({ name: official.name, ocdid: ocdid_temp,
          title: title_temp, address: address_temp, party: party_temp, photo: photo_temp })
      reps.push(rep)
    end
    reps
  end
end

def array_concat(address)
  if address.present? # i guess some reps dont have addresses listed
    address_array = [
      address[0].line1,
      address[0].line2,
      address[0].line3,
      address[0].city,
      address[0].state,
      address[0].zip
    ]
    address_array = address_array.reject(&:blank?).join(', ')
  else
    address_array = 'No Public Address'
  end
  address_array
end

#------------------------------------------------------------------------------
# Representative
#
# Name       SQL Type             Null    Primary Default
# ---------- -------------------- ------- ------- ----------
# id         INTEGER              false   true
# name       varchar              true    false
# created_at datetime             false   false
# updated_at datetime             false   false
# ocdid      varchar              true    false
# title      varchar              true    false
#
#------------------------------------------------------------------------------
