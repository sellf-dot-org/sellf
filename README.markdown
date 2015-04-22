# sellf.org

data

can be a file, or a subscription

can also be a set containing other files or subscriptions

user

is a buyer and a seller

can have data [set or file or subscription]

can buy data  [set or file or subscription]

two user:data associations:

via Data or via Purchase

also: user:user association; subscribe to all.

maybe a user can have a Buyer a Seller or both
User handles stripe, seller has Data, buyer has Purchases


```ruby
User
    has_one :seller
    has_one :buyer
end

Seller
    has_many :data
    belongs_to :user
end

Buyer
    has_many :data
    belongs_to :user
end

Datum
    has_many :members, class_name: "Datum",
                       foreign_key: "data_set_id"

    belongs_to :data_set, class_name: "Datum"

    has_one :seller
    has_many :buyers

    belongs_to :datable, polymorphic: true
end

File
    belongs_to :datum, as :datable
end

Subscription
    belongs_to :datum, as :datable
end
```
