module LocationsHelper
  def is_safe location
    location.safe ? "safe" : "notsafe"
  end
  
  def safe_label location
    location.safe ? "Safe" : "Not Safe"
  end

  def elevator_present
    @location.elevator_status == "Yes" or @location.elevator_status == "No"
  end

  def elevator_safe
    @location.elevator_status == "Yes" 
  end
  
  def address_local location
    s = location.address
    s.slice! ", USA"
    s
  end
    
end
