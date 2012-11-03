module LocationsHelper
  def is_safe location
    location.safe ? "safe" : "notsafe"
  end
  
  def safe_label location
    location.safe ? "Safe" : "Not Safe"
  end

  def is_checked
    @location.elevators_safe ? "checked" : ""
  end

  def is_no
    #(not @location.elevators_safe && @location.elevators_available) ? "checked" : ""
    "checked"
  end

  def is_na
    @location.elevators_available ? "" : "checked"
  end
end
