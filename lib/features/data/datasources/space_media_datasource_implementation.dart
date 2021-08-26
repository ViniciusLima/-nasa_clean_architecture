import 'dart:convert';

import 'package:nasa_clean_arch/core/usecase/errors/exceptions.dart';
import 'package:nasa_clean_arch/core/usecase/http_client/http_client.dart';
import 'package:nasa_clean_arch/core/utils/date_input_converter.dart';
import 'package:nasa_clean_arch/features/data/datasources/endpoints/nasa_endpoints.dart';
import 'package:nasa_clean_arch/features/data/datasources/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/data/models/space_media_model.dart';

class SpaceMediaDatasourceImplementation implements ISpaceMediaDatasource {
  final HttpClient client;

  SpaceMediaDatasourceImplementation(this.client);

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final response = await client
        .get(NasaEndpoints.apod('DEMO_KEY', DateInputConverter().format(date)));

    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(jsonDecode(response.data));
    } else
      throw ServerException();
  }
}
