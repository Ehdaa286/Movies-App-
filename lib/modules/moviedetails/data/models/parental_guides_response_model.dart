class ParentalGuidesResponse {
  final String status;
  final String statusMessage;
  final ParentalGuidesData data;

  ParentalGuidesResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
  });

  factory ParentalGuidesResponse.fromJson(Map<String, dynamic> json) =>
      ParentalGuidesResponse(
        status: json['status'] ?? '',
        statusMessage: json['status_message'] ?? '',
        data: ParentalGuidesData.fromJson(json['data']),
      );
}

class ParentalGuidesData {
  final int movieId;
  final List<ParentalGuideModel> parentalGuides;

  ParentalGuidesData({
    required this.movieId,
    required this.parentalGuides,
  });

  factory ParentalGuidesData.fromJson(Map<String, dynamic> json) =>
      ParentalGuidesData(
        movieId: json['movie_id'] ?? 0,
        parentalGuides: (json['parental_guides'] as List<dynamic>? ?? [])
            .map((e) => ParentalGuideModel.fromJson(e))
            .toList(),
      );
}

class ParentalGuideModel {
  final String type;
  final String rating;
  final String description;

  ParentalGuideModel({
    required this.type,
    required this.rating,
    required this.description,
  });

  factory ParentalGuideModel.fromJson(Map<String, dynamic> json) =>
      ParentalGuideModel(
        type: json['type'] ?? '',
        rating: json['rating'] ?? '',
        description: json['description'] ?? '',
      );
}