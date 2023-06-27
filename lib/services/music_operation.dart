import 'package:CommunityBuilder/models/music.dart';

class MusicOperations{
  MusicOperations._() {}
  static List<Music> getMusic(){
    return <Music>[
      Music('Bhag Milkha', 'https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/fe/9e/54/fe9e54da-11a4-0c61-4adc-f2ac9d8d4416/886444045575.jpg/100x100bb.jpg', 'Bhaag Milkha Bhaag','https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview113/v4/05/2e/08/052e089e-214d-fb64-9ede-8d8aacbecbe4/mzaf_17601638004295560786.plus.aac.p.m4a'),
      Music('Apna Time Aayega', 'https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/de/3d/61/de3d61a9-1296-6a0f-6482-32723729d4b6/8718857674948.png/100x100bb.jpg', 'Apna Time Ayega','https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/0e/d5/52/0ed55222-e6ae-1e7f-24c1-284da449af4e/mzaf_169448091425248968.plus.aac.p.m4a'),
      Music('Perfect', 'https://is4-ssl.mzstatic.com/image/thumb/Music115/v4/15/e6/e8/15e6e8a4-4190-6a8b-86c3-ab4a51b88288/190295851286.jpg/100x100bb.jpg', 'Ed Sheeran','https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/ce/44/6d/ce446d11-7f99-d75c-2ff5-4ebb4662a027/mzaf_188179708856974999.plus.aac.p.m4a'),
      Music('Kesariya','https://is3-ssl.mzstatic.com/image/thumb/Music112/v4/9f/13/ca/9f13ca3b-e533-03e0-f19a-f0aaa774581d/196589311191.jpg/100x100bb.jpg','Pritam','https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/db/a6/77/dba677db-5b64-0a2d-c19f-0f18d8fcc040/mzaf_18437633248411199823.plus.aac.p.m4a'),
    ];
  }
}


