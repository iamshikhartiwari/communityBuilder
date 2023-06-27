import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(SearchScreen());
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Song> _searchResults = [];
  AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  String _currentTrackUrl = '';

  void _searchTracks(String query) async {
    final response = await http.get(Uri.parse('https://itunes.apple.com/search?term=$query&entity=song'));
    if (response.statusCode == 200) {
      final jsonResult = jsonDecode(response.body);
      setState(() {
        _searchResults = (jsonResult['results'] as List).map((result) => Song.fromJson(result)).toList();
      });
    }
  }

  void _playPauseTrack(String trackUrl) {
    if (_currentTrackUrl == trackUrl) {
      if (_isPlaying) {
        _audioPlayer.pause();
      } else {
        _audioPlayer.resume();
      }
      setState(() {
        _isPlaying = !_isPlaying;
      });
    } else {
      _audioPlayer.stop();
      _audioPlayer.play(UrlSource(trackUrl));
      setState(() {
        _isPlaying = true;
        _currentTrackUrl = trackUrl;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Music App'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onSubmitted: _searchTracks,
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (BuildContext context, int index) {
                  final song = _searchResults[index];
                  return ListTile(
                    leading: Image.network(song.artworkUrl),
                    title: Text(song.trackName),
                    subtitle: Text(song.artistName),
                    trailing: IconButton(
                      icon: Icon(_currentTrackUrl == song.previewUrl && _isPlaying
                          ? Icons.pause
                          : Icons.play_arrow),
                      onPressed: () {
                        _playPauseTrack(song.previewUrl);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Song {
  final String trackName;
  final String artistName;
  final String artworkUrl;
  final String previewUrl;

  Song({
    required this.trackName,
    required this.artistName,
    required this.artworkUrl,
    required this.previewUrl,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      trackName: json['trackName'],
      artistName: json['artistName'],
      artworkUrl: json['artworkUrl100'],
      previewUrl: json['previewUrl'],
    );
  }
}
