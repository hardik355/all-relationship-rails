#I have created all relationship example.
==========================================================================================
#1. Has One & Belongs To
==========================================================================================
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

      Why i added id in  pan_card_attributes because when record is update that time object think it's new record so old record will be deleted and new record is created.
  
Example 2:
  User       :- has_one :biography
  Biography  :- belongs_to :user

Example 3:
	has_one    :profile
	belongs_to :user

Example 4:
	has_one :office
	belongs_to :office 

Example 5:
	has_one :book 
	belongs_to : author


User Controller + Model already have created
rails g model Biography bio:text user:references
=========================================================================================
#2. Has Many
==========================================================================================
Example 1:
  Car   :- has_many :parts
  Part  :- belongs_to :car

Example 2:
  Mobile   :- has_many :apps
  App      :- belongs_to :mobile

Example 3:
  Artist    :- has_many :song
  Song      :- belongs_to :artist

  rails g model Artist name:string
  rails g model Song name:string artist:references

Example 4:
	has_many   :stories
  belongs_to :user
==========================================================================================
#3. HABTM
==========================================================================================
Example 1: 
  Post :  has_and_belongs_to_many :tags
  Tag  :  has_and_belongs_to_many :posts

  rails g scaffold post title:text description:text
  rails g scaffold tag title:text

  Step 2 :- Then Add Relantioship
    class Tag < ApplicationRecord
      has_and_belongs_to_many :posts
    end

    class Post < ApplicationRecord
      has_and_belongs_to_many :tags
    end
  
  Step 3 :- Create Join Table Migration
    rails generate migration CreateJoinTableUsersRoles posts tags

    Note: Please check in migration if any lines comment then remove comment.

  Step 4 :- Add collection select option in your form. like i used Post form.

    <%= f.collection_select :tag_ids, Tag.all, :id, :name, { prompt: 'Select groups' }, multiple: true %>

  Step 5 :- I'm add habtm option in post form, so you need to permit tag_ids in post 
            controller. 

    Note: Dont permit only tag_ids if you only permit tag_ids then create single record
          so permit with array like this tag_ids: []

  #RESULT
    user.roles # returns an array of roles associated with the user
    role.users # returns an array of users associated with the role

EXAMPLE 2:
  user : has_and_belongs_to_many :roles
  role : has_and_belongs_to_many :users
    
==========================================================================================
#4. Polymorphic ==> Require Join Table 
==========================================================================================
Example 1:
  User      :- has_many :address
  address   :- belongs_to :user

Example 2:
  Post     :- has_many :comments
  Article  :- has_many :comments
  comments :- belongs_to :post

Example 2:
	post: has_many :comments
	log:  has_many :comments

	rails g model comment commentable:references{polymorphic} content:text


Test in rails console
  1. Rails console create comment.
    Comment.create(commentable: Post.last, title: 'Hardik from console')

  2. Also you can create comment using this way.
    post = Post.last.comments.build
    post.save

  3. Check comment belongs to which post.
    Comment.last.commentable
==========================================================================================
#5. Has One Through
===========================================================================================
Example 1:
Example 2:

==========================================================================================
#6. Has Many Through
==========================================================================================
EXAMPLE 1:

	class User < ApplicationRecord
		has_many :user_roles
		has_many :roles, through: :user_roles
	end

	class UserRoles < ApplicationRecord
		belongs_to :user
		belongs_to :role
	end
	
	class Role < ApplicationRecord
		has_many :user_roles
		has_many :users, through: :user_roles
	end

Example 2:

==========================================================================================
Self join Table
==========================================================================================



=========================================================================================
Shallow Nested Routes
==========================================================================================
resource :articles do
    resource :comments, shallow :true
  end 

rails d scaffold Article name:string