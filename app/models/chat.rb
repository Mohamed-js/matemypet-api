class Chat < ApplicationRecord
    belongs_to :sender, class_name: "User", foreign_key: "sender_id"
    belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
    has_many :messages, -> { order(id: :desc) }
    has_many :unread_messages, -> { where.not(seen: true) }, class_name: "Message"
    has_one :last_message, -> { order(id: :desc) }, class_name: "Message"
end
