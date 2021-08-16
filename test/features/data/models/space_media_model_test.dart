import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_clean_arch/features/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/domain/entities/space_media_entity.dart';

import '../../mocks/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
      explanation:
          'rthlings typically watch meteor showers by looking up. But this remarkable view, captured on August 13, 2011 by astronaut Ron Garan, caught a Perseid meteor by looking down. From Garan\'s perspective onboard the International Space Station orbiting at an altitude of about 380 kilometers, the Perseid meteors streak below, swept up dust left from comet Swift-Tuttle heated to incandescence. The glowing comet dust grains are traveling at about 60 kilometers per second through the denser atmosphere around 100 kilometers above Earth\'s surface. In this case, the foreshortened meteor flash is right of frame center, below the curving limb of the Earth and a layer of greenish airglow, just below bright star Arcturus. Want to look up at a meteor shower?  You\'re in luck, as the 2021 Perseids meteor shower peaks this week. This year, even relatively faint meteors should be visible through clear skies from a dark location as the bright Moon will mostly absent.   Notable Perseids Submissions to APOD: 2018, 2019, 2020',
      mediaType: 'image',
      title: 'A Perseid Below',
      url: 'https://apod.nasa.gov/apod/image/2108/perseid_iss_1080.jpg');

  test('should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('should return a valid model', () {
    // Arrange
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    // Act
    final result = SpaceMediaModel.fromJson(jsonMap);
    // Assert
    expect(result, tSpaceMediaModel);
  });

  test('should return a json map containing the proper data', () {
    // Arrange
    final expectedMap = {
      "explanation":
          "rthlings typically watch meteor showers by looking up. But this remarkable view, captured on August 13, 2011 by astronaut Ron Garan, caught a Perseid meteor by looking down. From Garan's perspective onboard the International Space Station orbiting at an altitude of about 380 kilometers, the Perseid meteors streak below, swept up dust left from comet Swift-Tuttle heated to incandescence. The glowing comet dust grains are traveling at about 60 kilometers per second through the denser atmosphere around 100 kilometers above Earth's surface. In this case, the foreshortened meteor flash is right of frame center, below the curving limb of the Earth and a layer of greenish airglow, just below bright star Arcturus. Want to look up at a meteor shower?  You're in luck, as the 2021 Perseids meteor shower peaks this week. This year, even relatively faint meteors should be visible through clear skies from a dark location as the bright Moon will mostly absent.   Notable Perseids Submissions to APOD: 2018, 2019, 2020",
      "media_type": "image",
      "title": "A Perseid Below",
      "url": "https://apod.nasa.gov/apod/image/2108/perseid_iss_1080.jpg"
    };
    // Act
    final result = tSpaceMediaModel.toJson();
    // Assert
    expect(result, expectedMap);
  });
}
