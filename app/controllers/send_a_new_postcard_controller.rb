def send_a_new_post_card(current_sender)
    prompt = TTY::Prompt.new

    postcard_category = prompt.select("[Choose a type]  Awesome! Who are you looking to motivate today?", %w(Parent Grandparent Friend Colleague Spouse))
    postcard_receiver_name = prompt.ask("What his/her name?")
    receiver = Receiver.create(name: postcard_receiver_name) #create new receiver

    postcard_size = prompt.select("[Choose a size]   Great, what size postcard suits your fancy?", %w(Small($2.50) Medium($3.00) Large($3.50) ))
    size_cost = postcard_size.split("(")[1].slice(1,4).to_f

    postcard_message = prompt.ask("And, what would you like to say?")

    postcard_deco = prompt.select("Which postcard feature would you like?", %w(Audio($2.00) Animal($1.00) Landscape($1.00) Profile($1.00) Floral($1.00) Comedy($2.00)))
    deco_cost = postcard_deco.split("(")[1].slice(1,4).to_f

    total_cost = size_cost + deco_cost  # get total_cost
    
    postcard = Postcard.create(category: postcard_category, size: postcard_size, deco: postcard_deco, message: postcard_message, cost: total_cost) #create new postcard
  
    current_sender.postcards << postcard   #association
    receiver.postcards << postcard

    
    choices = {"[1] Yes, I would love to see my postcard" => -> do view_postcard(current_sender) end, 
               "[2] Revise my postcard" => -> do revise_your_postcard(current_sender) end, 
               "[3] Cancel this postcard" => -> do cancel_your_order(current_sender) end,
               "[4] Create another lovely postcard" => -> do send_a_new_post_card(current_sender) end,
               "[5] Exit" => -> do exit! end}.each {|option, methods| option}
    selection = prompt.select(" Your postcard is complete(total_cost: $#{total_cost}) Would you like to view your lovely postcard?", choices)
end