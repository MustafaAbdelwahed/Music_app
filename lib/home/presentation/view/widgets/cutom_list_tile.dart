import 'package:flutter/material.dart';
import 'package:music_app/home/presentation/view/song_view.dart';

class CutomListTile extends StatelessWidget {
  const CutomListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, SongView.routeName);
      },
      leading: const Icon(
        Icons.music_note,
        size: 30,
      ),
      //  leading: QueryArtworkWidget(
      //   keepOldArtwork: true,
      //   nullArtworkWidget: Container(
      //     width: 50,
      //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      //     child: const Icon(
      //       Icons.music_note,
      //       size: 30,
      //     ),
      //   ),
      //   id: song.id,
      //   type: ArtworkType.AUDIO,
      //   artworkBorder: BorderRadius.circular(5),
      // ),
      title: const Text(
        "Song Name",
        // song.title,
        maxLines: 1,
        style: TextStyle(overflow: TextOverflow.ellipsis),
      ),
      subtitle: const Text(
        " Artist name",
        // song.artist ?? "Unknown Artist",
        maxLines: 1,
        style: TextStyle(overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
