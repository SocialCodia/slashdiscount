class Slider {
  String? id, number, image, date;

  Slider({this.id, this.number, this.image, this.date});

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json['sliderImageId'],
        number: json['sequenceNo'],
        image: json['sliderImagePath'],
        date: json['addedDate'],
      );
}
