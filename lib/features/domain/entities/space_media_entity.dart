import 'package:equatable/equatable.dart';

class SpaceMediaEntity extends Equatable {
  final String explanation;
  final String mediaType;
  final String title;
  final String? url;

  SpaceMediaEntity({
    required this.explanation,
    required this.mediaType,
    required this.title,
    required this.url,
  });

  @override
  List<Object?> get props => [
        explanation,
        mediaType,
        title,
        url,
      ];
}
