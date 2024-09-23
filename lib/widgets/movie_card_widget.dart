import 'package:flutter/material.dart';
import 'package:showbox/common/utils.dart';
import 'package:showbox/models/upcoming_movie_model.dart';

class MovieCardWidget extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String headLineText;
  const MovieCardWidget({super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot){
        var data = snapshot.data?.results;
        return Column(
          children: [
            Text(
                headLineText,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data?.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network("$imageUrl${data?[index].posterPath}"),
                  );
                }
              ),
            )
          ],
        );
      }
    );
  }
}
