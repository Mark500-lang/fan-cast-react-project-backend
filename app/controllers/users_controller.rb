class UsersController < ApplicationController 
    get "/users" do
        users = User.all
        users.to_json(include: :reviews)
    end
    get "/users/:id" do
        user = User.find(params[:id])
        user.to_json(include: :reviews)
    end

    #post new users
    post "/users" do 
        user_name = params[:myusername]
        email= params[:myemail]

            if(user_name.present? && email.present?)
                #check iniqueness of username
                check_username_exists = User.where(username: user_name).count()
                
                if check_username_exists < 1
                    #check uniqueness of email
                    check_email_exists = User.where(email: email).count()

                    if check_email_exists < 1
                        user = User.create(username: user_name, email: email)
                        if user
                            message = {:succcess => "Account created successfully!!"}
                            message.to_json
                        else
                            message = {:error => "Error saving user!"}
                            message.to_json
                        end
                    else
                        message = {:error => "Email exists!"}
                        message.to_json
                    end
                else
                    message = {:error => "User-name is taken!"}
                    message.to_json
                end
            else
                message = {:error => "All fields should be filled!"}
                message.to_json
            end
            
        end
end