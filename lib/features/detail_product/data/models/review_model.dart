
class ReviewModel {
  final List<Review> reviews;
  final Summary summary;

  ReviewModel({required this.reviews, required this.summary});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviews: (json['reviews'] as List)
          .map((item) => Review.fromJson(item))
          .toList(),
      summary: Summary.fromJson(json['summary']),
    );
  }
}

class Review {
  final int id;
  final Profile profile;
  final String review;
  final int rating;
  final String date;

  Review({
    required this.id,
    required this.profile,
    required this.review,
    required this.rating,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      profile: Profile.fromJson(json['profile']),
      review: json['review'] ?? '',
      rating: json['rating'] ?? 0,
      date: json['date'] ?? '',
    );
  }
}

class Profile {
  final int id;
  final String fullName;
  final String image;

  Profile({required this.id, required this.fullName, required this.image});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      fullName: json['full_name'] ?? '',
      image: json['image']??"" ,
    );
  }
}

class Summary {
  final int oneStar;
  final int twoStar;
  final int threeStar;
  final int fourStar;
  final int fiveStar;

  Summary({
    required this.oneStar,
    required this.twoStar,
    required this.threeStar,
    required this.fourStar,
    required this.fiveStar,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      oneStar: json['one_star'] ?? 0,
      twoStar: json['two_star'] ?? 0,
      threeStar: json['three_star'] ?? 0,
      fourStar: json['four_star'] ?? 0,
      fiveStar: json['five_star'] ?? 0,
    );
  }
}


