# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Puppy.delete_all

Puppy.create(:name => 'Maggie Mae',
             :breed => 'Border Colie Mix',
             :description =>
             %{<p>
Very sweet and playful. She was dumped in a deserted area in Cleveland, one of our
volunteers stopped to feed her and she ran after the van as she drove away.  Needless
to say she was crying for help!  She was first timid and shy and now she has regained
her trust in people.  Maggie is very gentle and calm.
</p>},
             :gender => 'Female',
             :image_url => '/images/MaggieMae.jpg',
             :fees => 14.95)
             
Puppy.create(:name => 'Spud',
             :breed => 'Beagle/Hound Mix',
             :description =>
             %{<p>
This 2 year old handsome boy is housetrained, and loves riding in the car.  He is playful
and friendly and would make a great addition to your family.
</p>},
             :gender => 'Male',
             :image_url => '/images/Spud.jpg',
             :fees => 18.75)

Puppy.create(:name => 'Hanna',
             :breed => 'Labrador Retriever Mix',
             :description =>
             %{<p>
Little Hannah is 3 mos old.  She is energetic, loves to play with other dogs and fetch!  She
is a lovable-playful, typical puppy personality.  Hannah is a very confident little girl who
is always ready to go go go!  Hannah is working on basic manners with her forster mon, but
would benefit from puppy obedience school.  She is also crate trained.  If you are interested
in adding a new puppy to your family, please contact us to see if you are a good match.
</p>},
             :gender => 'Female',
             :image_url => '/images/Hannah.jpg',
             :fees => 22.99)

Puppy.create(:name => 'Brook',
             :breed => 'Golden Retriever',
             :description =>
             %{<p>
This young lady is trying to put her shelter eperience behind her.  She\'s only about 7
months old, and as you can see from her picture, she loves her toys!!  Basically a blank
slate as far as training, she\'ll fit into a new home very quickly.
</p>},
             :gender => 'Female',
             :image_url => '/images/Brook.jpg',
             :fees => 34.95)

             
