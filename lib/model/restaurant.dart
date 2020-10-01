class Restaurant {
  String imageURL;
  String name;
  String description;
  String address;
  String website;
  String phone;
  bool favorite;
  
  Restaurant({
    this.imageURL = '',
    this.name = '',
    this.description = '',
    this.address = '',
    this.website = '',
    this.phone = '',
    this.favorite = false
  });
  Restaurant.clone(Restaurant r) {
    this.favorite = r.favorite;
  }
}