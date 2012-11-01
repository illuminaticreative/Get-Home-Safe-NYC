Borough.destroy_all
Location.destroy_all

manhattan = Borough.create(name:"manhattan")
Location.create(address:"45 Rockefeller Plz", borough:manhattan)
