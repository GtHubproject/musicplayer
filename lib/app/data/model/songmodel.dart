class SongModel {
  final String title;
  final String artist;
  final String data; // Assuming data is the path to the song

  SongModel({required this.title, required this.artist, required this.data});

  factory SongModel.fromPath(String path) {
    // Perform logic to extract title, artist, and other properties from the path
    String title = "Extracted Title";
    String artist = "Extracted Artist";

    return SongModel(title: title, artist: artist, data: path );
  }
}
