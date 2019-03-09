
 Adam = Sender.create(name: "Adam Moran", password:"I am Adam", address: "Table 3", email: "Adam.Moran@flatironschool.com")

 ###### 1.Adam
 Adam_parent = Receiver.create(name: "Cathrine Minor", address: "4643 Michael Street")
 Adam_colleague = Receiver.create(name: "Tori Vang", address: "2433  Monroe Street")
 Adam_friend = Receiver.create(name: "Zac Efron", address: "1318 Westheimer Rd")
 Postcard.create(sender_id: 1, receiver_id: 1, category:"Parent", size:"Large($3.50)", deco: "Profile($1.00)", cost:4.50, 
                 message:"Everything you’ve ever wanted is on the other side of fear!")
 Postcard.create(sender_id: 1, receiver_id: 2, category:"Colleague", size:"Large($3.50)", deco: "Audio($2.00)", cost:4.50,                      
                 message:"Start by doing what’s necessary; then do what’s possible; and suddenly you are doing the impossible.")
 Postcard.create(sender_id: 1, receiver_id: 3, category:"Friend", size:"Medium($3.00)", deco: "Landscape($1.00)", cost:4.00, 
                 message:"Your are not a product of your circumstances. You are a product of your decisions.")
 Postcard.create(sender_id: 1, receiver_id: 4, category:"Friend", size:"Medium($3.00)", deco: "Animal($1.00)", cost:4.00, 
                 message:"The best way to gain self-confidence is to do what you are afraid to do")


 ##### 2.Cory
 Cory = Sender.create(name: "Cory Harper", password:"I am Cory", address: "Table 1", email: "Cory.Harper@flatironschool.com")
 Cory_friend = Receiver.create(name: "Taylor Swift", address: "3681  Monroe Street")
 Cory_Colleague = Receiver.create(name: "Ryan Reynolds", address:"871 Sutter St")
 Cory_grandparent = Receiver.create(name: "George Clooney", address:"974 Valencia St")

 Postcard.create(sender_id: 2, receiver_id: 4, category:"Friend", size:"Large($3.50)", deco: "Comedy($2.00)", cost:5.50, 
                 message:"Everything you’ve ever wanted is on the other side of fear!")
 Postcard.create(sender_id: 2, receiver_id: 5, category:"Colleague", size:"Large($3.50)", deco: "Profile($1.00)", cost:3.50, 
                 message:"You’re going to go through tough times – that’s life. But I say, ‘Nothing happens to you, it happens for you.’ See the positive in negative events.")
 Postcard.create(sender_id: 2, receiver_id: 6, category:"Grandparent", size:"Medium($3.0)", deco: "Landscape($1.00)", cost:3.00, 
                 message:"Success means doing the best we can with what we have. Success is the doing, not the getting; in the trying, not the triumph. Success is a personal standard, reaching for the highest that is in us, becoming all that we can be.")
 Postcard.create(sender_id: 2, receiver_id: 2, category:"Friend", size:"Small($2.50)", deco: "Animal($1.00)", cost:3.50, 
                 message:"The two most important days in your life are the day you are born and the day you find out why.")



 #### 3.Eli 
 Eli = Sender.create(name: "Eli Lauffenburger", address: "Table 2", email: "Eli.Lauffenburger@flatironschool.com")
 Eli_friend = Receiver.create(name: "Natalie Portman", address: "505 Beach St")
 Eli_Colleague = Receiver.create(name: "Ben Affleck", address:"3499 16th St")
 Eli_grandparent = Receiver.create(name: "Daniel Craig", address:"1965 Al Scoma Way")

 Postcard.create(sender_id: 3, receiver_id: 7, category:"Friend", size:"Large($3.50)", deco: "Comedy($2.00)", cost:5.50, 
                 message:"It is during our darkest moments that we must focus to see the light.")
 Postcard.create(sender_id: 3, receiver_id: 8, category:"Colleague", size:"Large($3.50)", deco: "Profile($1.00)", cost:3.50, 
                 message:"You’re going to go through tough times – that’s life. But I say, ‘Nothing happens to you, it happens for you.’ See the positive in negative events.")
 Postcard.create(sender_id: 3, receiver_id: 9, category:"Grandparent", size:"Medium($3.0)", deco: "Landscape($1.00)", cost:3.00, 
                 message:"Perfection is not attainable, but if we chase perfection we can catch excellence.")
 



=begin

first_name, last_name, address, email, balance
 Adam, Moran, Table 3, Adam.Moran@flatironschool.com
 Cory, Harper, Table 1, Cory.Harper@flatironschool.com
 Eli, Lauffenburger, Table 2, Eli.Lauffenburger@flatironschool.com
 Hemalatha, Murugan, Table 3, Hemalatha.Murugan@flatironschool.com
 Jack, Rotta, Table 2, Jack.Rotta@flatironschool.com
 Jessica, Brumfield, Table 4, Jessica.Brumfield@flatironschool.com
 Jing, Chen, Table 1, Jing.Chen@flatironschool.com
 Josephine, Yao, Table 3, Josephine.Yao@flatironschool.com
 Mark, Pothecary, Table 3, Mark.Pothecary@flatironschool.com
 Olivia, Auzenne, Table 2, Olivia.Auzenne@flatironschool.com
 Robert, Vidal, Table 4, Robert.Vidal@flatironschool.com
 Rochell,  Flood, Table 2, Rochell.Flood@flatironschool.com
 Theodore, Kimana, Table 1, Theodore.Kimana@flatironschool.com
 Thomas, Hansen, Table 1, Thomas.Hansen@flatironschool.com
 Trey, Beauchamp, Table 4, Trey.Beauchamp@flatironschool.com
 Zoe, Bai, Table 4, Zoe.Bai@flatironschool.com

=end