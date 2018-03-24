class FieldOfInterestsController < ApplicationController


   def get_user_field_of_interests
     user_interest_ids = current_donor.field_of_interests.ids

     all_interests = get_field_of_interests.to_a
     @combined_interests = []

     all_interests.each do |i|
       @combined_interests.append({
         name: i.name,
         category: i.category,
         subcategory: i.subcategory,
         liked: user_interest_ids.include?(i.id),
         id: i.id
       })
     end

     respond_to do |format|
       format.html {render partial: 'layouts/field_of_interest'}
     end
   end

   def update_user_field_of_interest
     Rails.logger.debug

     #TODO: need to update funding needs too
     get_user_field_of_interests
   end

   private
   def get_field_of_interests
     @interests = Interest.all
   end



end
