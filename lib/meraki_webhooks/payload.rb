require "dry-struct"
require "http"
require 'multi_json'

class MerakiWebhooks::Payload

  def initialize(json)
    @payload = MultiJson.load(json)
    @data = Data.new(@payload)
  end

  def self.from_json(json)
    @payload = new(MultiJson.load(json))
  end

  def raw
    @payload
  end

  def shared_secret
    @data.sharedSecret
  end

  def sent_at
    @data.sentAt
  end

  def organisation_id
    @data.organizationId
  end

  def organization_name
    @data.organizationName
  end

  def organization_url
    @data.organizationUrl
  end

  def network_id
    @data.networkId
  end

  def network_name
    @data.networkName
  end

  def network_tags
    @data.networkTags
  end

  def device_serial
    @data.deviceSerial
  end

  def device_type
    @data.deviceMac
  end

  def device_name
    @data.deviceName
  end

  def device_url
    @data.deviceUrl
  end

  def device_tags
    @data.deviceTags
  end

  def device_model
    @data.deviceModel
  end

  def alert_id
    @data.alertId
  end

  def alert_type
    @data.alertType
  end

  def alert_type_id
    @data.alertTypeId
  end

  def occurred_at
    @data.occurredAt
  end

  def alert_data
    @data.alertData
  end

  module Types
    include Dry.Types()
  end

  class Data < Dry::Struct
    transform_keys(&:to_sym)
    transform_types do |type|
      if type.default?
        type.constructor do |value|
          value.nil? ? Dry::Types::Undefined : value
        end
      else
        type
      end
    end

    attribute :version, Types::Strict::String
    attribute :sharedSecret, Types::Strict::String.optional
    attribute :sentAt, Types::Strict::String
    attribute :organizationId, Types::Strict::String
    attribute :organizationName, Types::Strict::String
    attribute :organizationUrl, Types::Strict::String
    attribute :networkId, Types::Strict::String
    attribute :networkName, Types::Strict::String
    attribute :networkTags, Types::Coercible::Array

    attribute :deviceSerial, Types::Strict::String
    attribute :deviceMac, Types::Strict::String
    attribute :deviceName, Types::Strict::String
    attribute :deviceUrl, Types::Strict::String
    attribute :deviceTags, Types::Coercible::Array
    attribute :deviceModel, Types::Strict::String
    attribute :alertId, Types::Strict::String
    attribute :alertType, Types::Strict::String
    attribute :alertTypeId, Types::Strict::String
    attribute :alertLevel, Types::Strict::String
    attribute :occurredAt, Types::Strict::String
    attribute :alertData, Types::Coercible::Array
  end
end
