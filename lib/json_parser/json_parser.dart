//model fro https://javiercbk.github.io/json_to_dart/

void main() {
  var myMap = {
    "name": "Pizza da Mario",
    "cuisine": "Italian",
    "reviews": [
      {"score": 4.5, "review": "The pizza was amazing!"},
      {"score": 5.0, "review": "Very friendly staff, excellent service!"}
    ]
  };

  print(myMap);
  var obj = Restaurant.fromJson(myMap);
  var myReviews = obj.reviews;
  myReviews!.map((review) {
    print(review.review);
  }).toList();
}

class Restaurant {
  String? name;
  String? cuisine;
  List<Reviews>? reviews;

  Restaurant({this.name, this.cuisine, this.reviews});

  Restaurant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cuisine = json['cuisine'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cuisine'] = cuisine;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  double? score;
  String? review;

  Reviews({this.score, this.review});

  Reviews.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    review = json['review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['score'] = score;
    data['review'] = review;
    return data;
  }
}
