class FieldOfInterestsController < ApplicationController


   def get_user_field_of_interests
     @user_interests = current_donor&.field_of_interests.to_a || Donor.find(1).field_of_interests.to_a

     all_interests = get_field_of_interests.to_a

     user_interests_ids = @user_interests.map { |i| i.interest_id }
     combined_interests = []

     all_interests.each do |i|
       combined_interests.append({
         name: i.name,
         liked: user_interests_ids.include?(i.id)
       })
     end

     respond_to do |format|
       format.json { render json: combined_interests.to_json }
     end
   end

   private
   def get_field_of_interests
     @interests = Interest.all
   end



end
