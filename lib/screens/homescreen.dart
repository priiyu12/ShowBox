import 'package:flutter/material.dart';
import 'package:showbox/common/utils.dart';
import 'package:showbox/models/upcoming_movie_model.dart';
import 'package:showbox/services/api_services.dart';
import 'package:showbox/widgets/movie_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingMovieModel> upcomingFuture;

  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Image.asset(
          "assets/logo.png",
          height: 120,
          width: 140,
          alignment: Alignment.centerLeft,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                // Add search functionality
              },
              child: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              color: Colors.blue,
              height: 27,
              width: 27,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  child: MovieCardWidget(
                      future: upcomingFuture,
                      headLineText: "Upcoming Movies"
                  ),
                ),
              ],
            )
        )
    );
  }
}
