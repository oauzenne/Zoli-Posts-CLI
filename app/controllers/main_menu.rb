def main_menu(current_sender)
    puts ""
    puts ""
    prompt = TTY::Prompt.new
    choices = {"[1] Send a new postcard" => -> do send_a_new_post_card(current_sender) end, 
               "[2] View your postcard" => -> do view_postcard(current_sender) end, 
               "[3] Revise your postcard" => -> do revise_your_postcard(current_sender) end, 
               "[4] Cancel your order" => -> do cancel_your_order(current_sender)end,
               "[5] Exit" => -> do exit! end }.each {|option, methods| option}
    selection = prompt.select("Welcome back #{current_sender.name.split(" ")[0]}! What would you like to do?", choices)
end