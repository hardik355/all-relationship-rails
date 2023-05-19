#I have created all relationship example.

#1. Has One & Belongs To

  Example 1:
    User     :- has_one :pancard
    PanCard  :- belongs_to :user

    rails g controller Users
    rails g model User f_name:string l_name:string email:string country:string
    rails g model PanCard pan_number:bigint user:references


  Example 2:
    User       :- has_one :biography
    Biography  :- belongs_to :user

    User Controller + Model already have created
    rails g model Biography bio:text user:references

#2. Has Many

  Example 1:
    Car   :- has_many :parts
    Part  :- belongs_to :user

  Example 2:
    Mobile   :- has_many :apps
    App      :- belongs_to :mobile

#3. HABTM

  Example 1:
  Example 2:

#4. Polymorphic
    How to create impliment a polymorphic relationship.

  Example 1:
      User      :- has_many :address
      address   :- belongs_to :user

  Example 2:
    Post     :- has_many :comments
    Article  :- has_many :comments
    comments :- belongs_to :post


#5. Has One Through

  Example 1:
  Example 2:

#6. Has Many Through

  Example 1:
  Example 2:
