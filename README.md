#I have created all relationship example.
#1. Has One & Belongs To

  Example 1:
    User     :- has_one :pancard
    PanCard  :- belongs_to :user

    rails g controller Users
    rails g model User f_name:string l_name:string email:string country:string password:string
    rails g model PanCard pan_number:bigint user:references

    ADD PAN DETAIL WHEN USER IS CREATED
      1. First Add Relationship
      
      2. Second Create Nested Form like.
          I already created please check user form.

      3. Also In model level config, Add dependent destroy because when record delete it will 
         generate error.fk error. If you want to try remove dependent destroy and check. 
          has_one :pan_card, dependent: :destroy
          accepts_nested_attributes_for :your_model_name.

      4. Controller Gave nested attribute permission.
          def user_params
            params.require(:user).permit(:f_name, :l_name, :email, :country, :password,
            pan_card_attributes: [:id, :pan_number])
          end

          Why i added id in  pan_card_attributes because when record is update that time object think it's new record so old record will be deleted and new record is insert.
     

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
