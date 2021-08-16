import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/usecase/errors/exceptions.dart';
import 'package:nasa_clean_arch/core/usecase/errors/failures.dart';
import 'package:nasa_clean_arch/features/data/datasources/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/data/repositories/space_media_repository_implementation.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });

  final tSpaceMediaModel = SpaceMediaModel(
      explanation:
          'rthlings typically watch meteor showers by looking up. But this remarkable view, captured on August 13, 2011 by astronaut Ron Garan, caught a Perseid meteor by looking down. From Garan\'s perspective onboard the International Space Station orbiting at an altitude of about 380 kilometers, the Perseid meteors streak below, swept up dust left from comet Swift-Tuttle heated to incandescence. The glowing comet dust grains are traveling at about 60 kilometers per second through the denser atmosphere around 100 kilometers above Earth\'s surface. In this case, the foreshortened meteor flash is right of frame center, below the curving limb of the Earth and a layer of greenish airglow, just below bright star Arcturus. Want to look up at a meteor shower?  You\'re in luck, as the 2021 Perseids meteor shower peaks this week. This year, even relatively faint meteors should be visible through clear skies from a dark location as the bright Moon will mostly absent.   Notable Perseids Submissions to APOD: 2018, 2019, 2020',
      mediaType: 'image',
      title: ' Perseid Below',
      url: 'https://apod.nasa.gov/apod/image/2108/perseid_iss_1080.jpg');

  final tDate = DateTime(2021, 8, 8);

  test('should return space media model when calls the datasource', () async {
    // Arrange
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => tSpaceMediaModel);
    // Act
    final result = await repository.getSpaceMediaFromDate(tDate);
    // Assert
    expect(result, Right(tSpaceMediaModel));
    verify(() => datasource.getSpaceMediaFromDate(tDate)).called(1);
  });

  test(
      'should return a server failure when the call to datasource is unsucessful',
      () async {
    // Arrange
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenThrow(ServerException());
    // Act
    final result = await repository.getSpaceMediaFromDate(tDate);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getSpaceMediaFromDate(tDate)).called(1);
  });
}
