import 'package:nasa_clean_arch/features/domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity {
  SpaceMediaModel({
    required String explanation,
    required String mediaType,
    required String title,
    required String url,
  }) : super(
          explanation: explanation,
          mediaType: mediaType,
          title: title,
          url: url,
        );

  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) =>
      SpaceMediaModel(
        explanation: json['explanation'],
        mediaType: json['media_type'],
        title: json['title'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'explanation': explanation,
        'media_type': mediaType,
        'title': title,
        'url': url,
      };
}
