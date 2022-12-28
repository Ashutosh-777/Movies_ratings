import 'dart:convert';
import 'package:http/http.dart' as http;
import 'trending_movies_model.dart';
final List  Title2=[];
final List<String> image_url2=[];
final List average_vote2=[];



class Movies_toprated {
   static getTop_rated() async {
    var uri =Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=0c1881819b36de377c0212f81949a9a3&language=en-US&page=1');
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    List<MoviesModel> abc=[];

    for(int i=0;i<body['results'].length ;i++){
      //var xyz=body['results'][i]['title'];
      // xyz ??= body['results'][i]['name'];
      abc.add(MoviesModel(
        title: body['results'][i]['title'],
        poster_path: body['results'][i]['poster_path'],
        //vote_average: body['results'][i]['vote_average'],
      )
      );
    }
    return abc ;
  }

}