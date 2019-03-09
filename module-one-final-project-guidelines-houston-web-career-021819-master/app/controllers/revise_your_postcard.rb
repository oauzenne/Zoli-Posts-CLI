

def revise_your_postcard(current_sender)
  prompt = TTY::Prompt.new
  puts ""

  counter = 1    
  all_postcards  = {}
  current_sender.postcards.map do |postcard|
  all_postcards[counter] = postcard.receiver.name  #returns {1 => "Jack Rotta", 2 => "Amily"}
  counter += 1
  end


  selected_receiver = prompt.select("💌  Which card would you like to revise?  💌", all_postcards.map{|index, receiver_name| receiver_name})  #grab the name of the receiver
    
  selected_receiver_id = Receiver.find_by(name: selected_receiver)  #grab receiver's id
  selected_postcard = Postcard.find_by(receiver_id: selected_receiver_id) #grab the postcard by receiver id



  choices = {"[1] Change Type" => -> do change_type(current_sender, selected_postcard) end, 
             "[2] Change Size" => -> do change_size(current_sender, selected_postcard) end, 
             "[3] Change Decoration" => -> do change_deco(current_sender, selected_postcard) end, 
             "[4] Change Message" => -> do change_message(current_sender,selected_postcard)end, 
             "[5] Change the Receiver" => -> do change_the_receiver(current_sender,selected_postcard) end,
             "[6] Go back to main menu" => -> do main_menu(current_sender) end,
             "[7] Exit" => -> do exit! end}.each {|option, methods| option}
  selection = prompt.select("How would you like to revise your card #{current_sender.name.split(" ")[0]}?", choices) 
  

end




def change_type(current_sender,selected_postcard)
  puts ""
  prompt = TTY::Prompt.new
  new_type = prompt.select("[Choose a type]  How would you like to change who you're motivating?", %w(Parent Grandparent Friend Colleague Spouse))
  selected_postcard.update(category: new_type)
  
  choices = {"[1] Yes I would like to see my postcard" => -> do view_postcard(current_sender) end, 
             "[2] No take me back to main menu" => -> do main_menu(current_sender) end, 
             "[3] Revise my postcard" => -> do revise_your_postcard(current_sender) end, 
             "[4] Cancel my postcard" => -> do cancel_your_order(current_sender) end,
             "[5] Exit" => -> do exit! end}.each {|option, methods| option}
  selection = prompt.select("Would you like to view your lovely postcard?", choices)
end





def change_size(current_sender, selected_postcard)
  puts ""
  prompt = TTY::Prompt.new
  new_size = prompt.select("[Choose a size]  Please choose your new postcard size:", %w(Small($2.50) Medium($3.00) Large($3.50) ))
  new_size_cost = new_size.split("(")[1].slice(1,4).to_f 

  old_size_cost = selected_postcard.size.split("(")[1].slice(1,4).to_f
  
  new_total_cost = selected_postcard.cost - old_size_cost + new_size_cost
  
  selected_postcard.update(size: new_size, cost: new_total_cost) 
  

  choices = {"[1] Yes I would like to see my postcard" => -> do view_postcard(current_sender) end, 
             "[2] No take me back to main menu" => -> do main_menu(current_sender) end, 
             "[3] Revise my postcard" => -> do revise_your_postcard(current_sender) end, 
             "[4] Cancel my postcard" => -> do cancel_your_order(current_sender) end,
             "[5] Exit" => -> do exit! end}.each {|option, methods| option}
  selection = prompt.select("Would you like to view your lovely postcard?", choices)
end




def change_deco(current_sender, selected_postcard)
  prompt = TTY::Prompt.new

  puts ""
  new_deco = prompt.select("[Choose a size]  Please choose your new postcard decoration:",  %w(Audio($2.00) Animal($1.00) Landscape($1.00) Profile($1.00) Floral($1.00) Comedy($2.00)))
  old_deco_cost = selected_postcard.deco.split("(")[1].slice(1,4).to_f

  new_deco_cost = new_deco.split("(")[1].slice(1, 4).to_f

  new_total_cost = selected_postcard.cost - old_deco_cost + new_deco_cost

  selected_postcard.update(deco: new_deco, cost: new_total_cost) 

  choices = {"[1] Yes I would like to see my postcard" => -> do view_postcard(current_sender) end, 
             "[2] No take me back to main menu" => -> do main_menu(current_sender) end, 
             "[3] Revise my postcard" => -> do revise_your_postcard(current_sender) end, 
             "[4] Cancel my postcard" => -> do cancel_your_order(current_sender) end,
             "[5] Exit" => ->do exit! end}.each {|option, methods| option}
  selection = prompt.select("Would you like to view your lovely postcard?", choices)
end




def change_message(current_sender, selected_postcard)
  prompt = TTY::Prompt.new
  puts ""
  new_message = prompt.ask("Please enter your new message:" )
  selected_postcard.update(message: new_message) 

  choices = {"[1] Yes I would like to see my postcard" => -> do view_postcard(current_sender) end, 
             "[2] No take me back to main menu" => -> do main_menu(current_sender) end, 
             "[3] Revise my postcard" => -> do revise_your_postcard(current_sender) end, 
             "[4] Cancel my postcard" => -> do cancel_your_order(current_sender) end,
             "[5] Exit" => -> do exit! end}.each {|option, methods| option}
  selection = prompt.select("Would you like to view your lovely postcard?", choices)
end


def change_the_receiver(current_sender, selected_postcard)
  prompt = TTY::Prompt.new
  puts ""
  new_receiver_name = prompt.ask("Please enter the receiver's name:" )
  new_receiver_address = prompt.ask("Please enter the receiver's address:" )
  new_receiver = Receiver.create(name: new_receiver_name, address:new_receiver_address)  #create new receiver

  new_postcard = Postcard.create(category: selected_postcard.category, size:selected_postcard.size, deco: selected_postcard.deco, message: selected_postcard.message, cost:selected_postcard.cost) #create new postcard
  new_receiver.postcards << new_postcard  #association
  current_sender.postcards << new_postcard
  Postcard.destroy(selected_postcard.id)

  choices = {"[1] Yes I would like to see my postcard" => -> do view_postcard(current_sender) end, 
             "[2] No take me back to main menu" => -> do main_menu(current_sender) end, 
             "[3] Revise my postcard" => -> do revise_your_postcard(current_sender) end, 
             "[4] Cancel my postcard" => -> do cancel_your_order(current_sender) end,
             "[5] Exit" => -> do exit! end}.each {|option, methods| option}
  selection = prompt.select("Would you like to view your lovely postcard?", choices)
end


