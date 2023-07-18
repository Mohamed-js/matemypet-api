class User < ApplicationRecord
    has_secure_password
    has_many :animals
    has_one :subscription
    has_many :user_reports
    has_many :user_notifications
    has_many :likes, foreign_key: "liker_user_id"
    has_many :dislikes, foreign_key: "disliker_user_id"
    has_many :messages, foreign_key: "sender_id"
    has_many :unread_messages, -> { where(seen: :false) }, foreign_key: "sender_id"
    has_many :sent_chats, class_name: "Chat", foreign_key: "sender_id"
    has_many :received_chats, class_name: "Chat", foreign_key: "receiver_id"

    def chats
        sent_chats + received_chats
    end

    def like liker_a_id, liked_a_id, liked_u_id
        like_found = Like.find_by(liked_animal_id: liker_a_id, liker_animal_id: liked_a_id)
        if like_found
            # HERE IS MATCH, SO the liker animal here will not be the one that sent last...
            like_found.is_liked_back = true
            like_found.save
            # Variables
            liker_user_id = like_found.liker_user_id
            liker_animal = Animal.find like_found.liker_animal_id
            liked_user_id = like_found.liked_user_id
            liked_animal = Animal.find like_found.liked_animal_id
            animal_type = like_found.liked_animal.type.name

            # The first user 'who liked first'
            UserNotification.create(user_id: liker_user_id, title: "It's a match!", body: "Your #{animal_type} #{liked_animal.name} and #{liker_animal.name} seem to be a perfect match. Say hello..!", image: liked_animal.avatars.first.url, redirect_to: 'animal_screen', redirect_to_id: liked_animal.id )
            UserNotification.create(user_id: liked_user_id, title: "It's a match!", body: "Your #{animal_type} #{liker_animal.name} and #{liked_animal.name} seem to be a perfect match. Say hello..!", image: liker_animal.avatars.first.url, redirect_to: 'animal_screen', redirect_to_id: liker_animal.id )

            # Search previous chat in case they had already matched before together...
            prev_chat = Chat.where(sender_id: liker_user_id, receiver_id: liked_user_id).or(Chat.where(sender_id: liked_user_id, receiver_id: liker_user_id))
        
            if prev_chat.length > 0
                # There is existing chat
                prev_chat.messages.build(sender_id: liker_user_id, body: "Hello it seems our pets do have a match again..!", seen: false).save
                prev_chat.messages.build(sender_id: liked_user_id, body: "Yes, they seem to do, again..!", seen: false).save
            else
                # There is no previous chat
                new_chat = Chat.create(sender_id: liker_user_id, receiver_id: liked_user_id, last_updated: DateTime.now)
                new_chat.messages.build(sender_id: liker_user_id, body: "Hello it seems our pets do have a match..!", seen: false).save
                new_chat.messages.build(sender_id: liked_user_id, body: "Yes, they seem to do..!", seen: false).save
            end
        else
            likes.build(liker_animal_id: liker_a_id, liked_animal_id: liked_a_id, liked_user_id: liked_u_id, is_liked_back: false).save
        end
        {
            is_match: like_found || false,
            should_minus_likes: !subscription.has_unlimited_likes
        }
    end

    def is_able_to_like
        if subscription.has_unlimited_likes
            true
        elsif subscription.likes > 0
            if subscription.likes == subscription.likes_default
                subscription.first_like_date = DateTime.now 
                subscription.likes_updated = false
            end
            subscription.likes -= 1
            subscription.save
            true
        else
            false
        end
    end

    def create_subscription def_tier
        Subscription.create user_id: id, tier_id: def_tier.id, has_unlimited_likes: def_tier.has_unlimited_likes, likes: def_tier.likes, max_file_size: def_tier.max_file_size, pets: def_tier.pets, ads: def_tier.ads, likes_default: def_tier.likes, likes_updated: true
    end
end
