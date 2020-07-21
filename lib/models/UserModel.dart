class UserModel {
  String id;
  String name;
  String password;
  String instrumentPurchase;
  String houseNo;
  String addressLine1;
  String addressLine2;
  String phone;
  String phoneId;
  String country;
  String image;
  String email;
  List<dynamic> fav_user;

  UserModel(
      this.id,
      this.name,
      this.password,
      this.instrumentPurchase,
      this.houseNo,
      this.addressLine1,
      this.addressLine2,
      this.phone,
      this.phoneId,
      this.country,
      this.image,
      this.email,
      this.fav_user);
}
