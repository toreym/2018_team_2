class FieldOfInterestsController < ApplicationController


   def get_user_field_of_interests
     user_interests = current_donor.field_of_interests.where(:liked => true)
     user_interests ={
         :ids => user_interests.map{|interest| interest.interest_id},
         :categories => user_interests.map{|field_of_interest| field_of_interest.interest.category}
     }

     all_interests = get_field_of_interests.to_a.select do |interest|
       #either i'm a parent or my parent is selected
       !interest.subcategory.present? or user_interests[:categories].include?(interest.category)
     end
     @combined_interests = []

     all_interests.each do |i|
       @combined_interests.append({
         name: i.name,
         category: i.category,
         subcategory: i.subcategory,
         liked: user_interests[:ids].include?(i.id),
         id: i.id
       })
     end

     respond_to do |format|
       format.html {render partial: 'layouts/field_of_interest'}
     end
   end

   def update_user_field_of_interest
     field_of_interest = current_donor.field_of_interests.find_by(:interest_id => params[:interest_id])

     if field_of_interest
       liked = field_of_interest.liked
       if liked and !field_of_interest.interest.subcategory.present?
         children = current_donor.field_of_interests.joins('join interests on interests.id = field_of_interests.interest_id').where(:interests => {:category => field_of_interest.interest.category}).select('field_of_interests.id').map{|f_o_i| f_o_i.id}
         current_donor.field_of_interests.where(:id => children).update_all(:liked => !liked)
       end
       field_of_interest.update_attributes(:liked => !liked)
     else
       current_donor.field_of_interests.create(:liked => true, :interest_id => params[:interest_id])
     end
     #TODO: need to update funding needs too
     get_user_field_of_interests
   end

   private
   def get_field_of_interests
     @interests = Interest.all
   end



end
