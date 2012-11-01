module LocationsHelper
  def is_safe location
    location.safe ? "safe" : "notsafe"
  end
end
