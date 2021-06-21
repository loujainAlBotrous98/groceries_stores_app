class Address{
  final String city , country , otherDetails,state,street;

  Address({
      this.city, this.country, this.otherDetails, this.state, this.street});

factory Address.fromJson(Map<String , dynamic> json){
  return Address(
    city : json['city'],
    country : json['country'],
    otherDetails: json['otherDetails'],
    state: json['state'],
    street: json['street']
  );
}

  @override
  String toString() {
    return 'Address{city: $city, country: $country, otherDetails: $otherDetails, state: $state, street: $street}';
  }

// Map<String , String> toMap() =>{
//   "city" : city,
//   "country" : country,
//   "otherDetails" : otherDetails,
//   "state" : state,
//   "street" : street
//   };

}