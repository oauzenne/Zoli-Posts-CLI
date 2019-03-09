def login
    prompt = TTY::Prompt.new
    heart = prompt.decorate('❤ ', :magenta)
    
    answer = prompt.yes? "Are you a  member with us?"
    if answer == true
        puts "Please log in with your username and password"
        login = prompt.collect do
            key(:name).ask("username:")
            key(:password).mask("password", mask:heart) 
        end
            current_sender = Sender.find_by(name: login[:name], password: login[:password])
        if !current_sender
            puts ""
            puts "Invalid username or password, please try again or sign up for a new account"
            puts ""
            greeting
        else
            main_menu(current_sender)
        end

    else
        puts "Please create your account!"
        new_account = prompt.collect do
            key(:name).ask("username(full name):")
            key(:password).ask("password:")
            key(:email).ask("email:")
        end
        current_sender = Sender.create(name: new_account[:name], password: new_account[:password], email: new_account[:email])
        main_menu(current_sender)
    end
end

    