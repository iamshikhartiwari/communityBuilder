import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:chating/models/category.dart';
import 'package:flutter/material.dart';
import 'package:chating/services/category_operations.dart';
import 'package:chating/services/music_operation.dart';
import 'package:chating/models/music.dart';

import 'music/search.dart';

class MusicHome extends StatelessWidget {
  bool isPlaying =false;
  // const MusicHome({Key? key}) : super(key: key);
  Function _miniPlayer;
  MusicHome(this._miniPlayer); // Dart shorthand consrtuctor


  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 1.0,
      title: Text(
        message,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(
            Icons.settings,
            size: 30,
          ),
        )
      ],
    );
  }

  Widget createCategory(Category category) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          // Image.network(category.imageUrl, fit: BoxFit.cover),
          Image.network('https://picsum.photos/250?image=9'),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  createListOfCategories() {
    List<Category> categoryList = CategoryOperation.getCategories();
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget createGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 290,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListOfCategories(),
        crossAxisCount: 2,
      ),
    );
  }


  Widget createMusic(Music music) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190,
            width: 190,
            child: InkWell(
              onTap: () {
                _miniPlayer(music,stop: true);
              },
              child: Image.network(
                music.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            music.desc,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musiclist = MusicOperations.getMusic();
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Container(
            height: 260,
            child: ListView.builder(
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createMusic(musiclist[index]);
              },
              itemCount: musiclist.length,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              createAppBar("Rynex"),


              SizedBox(
                height: 5,
              ),
              createGrid(),
              createMusicList('Music for You'),
              createMusicList('Popular Music'),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlueAccent.shade700,
                Color(0x315979FF),
                Colors.black
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5, 0.9],
            ),
          ),
        ),
      ),
    );
  }
}
