module LocationsHelper
  def is_safe location
    location.safe ? "safe" : "notsafe"
  end
  
  def safe_label location
    location.safe ? "Safe" : "Not Safe"
  end
end
