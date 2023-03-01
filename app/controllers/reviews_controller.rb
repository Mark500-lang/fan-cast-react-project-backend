class ReviewsController < ApplicationController
    get "/reviews" do
        reviews = Review.all
        reviews.to_json
    end

    post "/reviews" do  
        score = params[:myscore]
        comment = params[:mycomment]

        if (score.present? && comment.present?)
            review = Review.create(score: score, comment: comment)
            if review
                message = {:success => "review saved successfully"}
                message.to_json
            else
                message = {:error => "Error saving review!"}
                message.to_json
            end
        else 
            message = {:error => "All fields should be filled!"}
            message.to_json
        end
    end
end