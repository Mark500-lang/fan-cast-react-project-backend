class ReviewsController < ApplicationController
    get "/reviews" do
        reviews = Review.all
        reviews.to_json
    end

    post "/reviews" do  
        score = params[:myscore]
        comment = params[:mycomment]
        user = params[:user]
        movie = params[:movie]

        if (score.present? && comment.present? && user.present? && movie.present?)
            review = Review.create(score: score, comment: comment, user_id: user, movie_id: movie)
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

    delete "/reviews/:id" do
        count_reviews = Review.where(id: params[:id]).count() #Integer 2,3,4,5
        if count_reviews>0
            review = Review.find(params[:id])
            review.destroy
            message = {:succcess => "Post deleted successfully!!"}
            message.to_json
        else
            message = {:error => "Post does not exist!"}
            message.to_json
        end
    end
end