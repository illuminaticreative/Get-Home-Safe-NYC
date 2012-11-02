Borough.destroy_all
Location.destroy_all

manhattan = Borough.create(name:"manhattan")
bronx = Borough.create(name:"bronx")
queens = Borough.create(name:"queens")
brooklyn = Borough.create(name:"brooklyn")
staten = Borough.create(name:"staten_island")

#Location.create(address:"45 Rockefeller Plz", borough:manhattan)
Location.create(address:"300 E 56th St.", borough:manhattan, safe:true)
