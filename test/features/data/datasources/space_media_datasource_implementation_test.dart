import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/usecase/http_client/http_client.dart';
import 'package:nasa_clean_arch/features/data/datasources/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/data/datasources/space_media_datasource_implementation.dart';

import '../../mocks/space_media_mock.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late ISpaceMediaDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = MockHttpClient();
    datasource = SpaceMediaDatasourceImplementation(client);
  });

  final tDateTime = DateTime(2021, 8, 8);

  final url =
      'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2021-08-08';

  test('should call the get method with correct url', () async {
    // Arrange
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
    // Act
    await datasource.getSpaceMediaFromDate(tDateTime);
    // Assert
    verify(() => client.get(url)).called(1);
  });
}
