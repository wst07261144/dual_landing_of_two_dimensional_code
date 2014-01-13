class ActivityInf < ActiveRecord::Base
  def self.update_data  activity
     activity.each do |t|
       ActivityInf.create(:activity_id=>activity[:activity_id],:bid_num=>activity[:bid_num],
                          :sign_up_num=>activity[:sign_up_num])
     end
  end

end
