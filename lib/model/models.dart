class plantModel {
  final String imageUrl;
  final String name;
  final int price;
  final String type;

  plantModel(
    this.imageUrl,
    this.name,
    this.price,
    this.type,
  );
}

class campaignModel {
  final String imageUrl;
  final int targetAmount;
  final int currentAmount;
  final String title;
  final String description;
  final String city;
  final String numberOfTrees;
  final String type;

  campaignModel(this.imageUrl, this.targetAmount, this.currentAmount,
      this.title, this.description, this.city, this.numberOfTrees, this.type);
}
