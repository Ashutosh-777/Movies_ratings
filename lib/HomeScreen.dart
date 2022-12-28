import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'now_playing.dart';
import 'top_rated.dart';
import 'trending_movies-data.dart';
import 'trending_movies_model.dart';
import 'login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  // String userName;
  // HomeScreen({
  //   required this.userName,
  // });



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MoviesModel>? now_playing;
  List<MoviesModel>? trending;
  List<MoviesModel>? top_rated;
  String base_url = 'http://image.tmdb.org/t/p/w500';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Center(child: Text("Welcome Ashutosh")),

          leading: IconButton(

            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context)=> Login_page(),
              )
              );
            },
            icon:Icon(
              Icons.logout,
            ),
          ),
        ),
        body: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const ListTile(
                      leading: Icon(
                        Icons.menu,
                      ),
                      title: Text("What's new"),
                      trailing: Icon(
                        Icons.search,
                      ),
                    )
                ),
              ),


              //Now Playing...


              const Text(
                'Now Playing',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,

                ),
              ),
              FutureBuilder (
                future: Movies_nowplaying.getNow_playing(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.hasData){
                    now_playing=snapshot.data;

                    return   SizedBox(
                      height: 234,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: now_playing?.length,
                          itemBuilder: (context,index){
                            return SizedBox(
                              width: 110,
                              child: Column(
                                children: [

                                  ClipRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,

                                      elevation: 4.0,
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Image.network(
                                        '${base_url}${now_playing?[index].poster_path}',
                                        width: 100,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${now_playing?[index].title}'),
                                  ),
                                ],
                              ),
                            );
                          }
                      ),
                    );
                  }else{
                    return Center(child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 5.0,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      semanticsLabel: 'Loading',
                    )
                    );
                  }
                },


              ),


              //Trending


              const Text(
                'Trending ',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,

                ),
              ),
              FutureBuilder (
                future: Movies_trending.getTrending(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.hasData){
                    trending=snapshot.data;
                    return   SizedBox(
                      height: 234,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: trending?.length,
                          itemBuilder: (context,index){
                            return SizedBox(
                              width: 110,
                              child: Column(
                                children: [

                                  ClipRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,

                                      elevation: 4.0,
                                      color: Colors.blue,

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Image.network(
                                        '${base_url}${trending?[index].poster_path}',
                                        width: 100,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${trending?[index].title}'),
                                  ),
                                ],
                              ),
                            );
                          }
                      ),
                    );
                  }else{
                    return Center(child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 5.0,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      semanticsLabel: 'Loading',
                    )
                    );
                  }
                },


              ),


              //top Rated :


              const Text(
                'Top Rated ',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,

                ),
              ),
              FutureBuilder (
                future: Movies_toprated.getTop_rated(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.hasData){
                    top_rated=snapshot.data;
                    return   SizedBox(
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: top_rated?.length,
                          itemBuilder: (context,index){
                            return SizedBox(
                              width: 110,
                              child: Column(
                                children: [

                                  ClipRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,

                                      elevation: 4.0,
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Image.network(
                                        '${base_url}${top_rated?[index].poster_path}',
                                        width: 100,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${top_rated?[index].title}'),
                                  ),
                                ],
                              ),
                            );
                          }
                      ),
                    );
                  }else{
                    return Center(child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 5.0,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      semanticsLabel: 'Loading',
                    )
                    );
                  }
                },


              ),
            ],
          ),
        ),
      );

  }
}





