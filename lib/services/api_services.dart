import 'dart:convert';
import 'dart:developer';

import 'package:showbox/common/utils.dart';
import 'package:showbox/models/upcoming_movie_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endpoint;

class ApiServices{

  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endpoint = 'movie/upcoming';
    final url = '$baseUrl$endpoint$key';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('success');
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load upcoming movies");
  }
}