import 'package:flutter/material.dart';
import 'package:music_app/home/presentation/view/widgets/neu_box._decor.dart';

class NueBox extends StatelessWidget {
  const NueBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NeuBoxDecor(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 300,
            /////////////////////////////////////////////
            child: Icon(Icons.music_note),
            //  QueryArtworkWidget(
            //     keepOldArtwork: true,
            //     size: 500,
            //     artworkFit: BoxFit.fill,
            //     quality: 100,
            //     nullArtworkWidget: const Icon(Icons.music_note),
            //     artworkBorder: BorderRadius.circular(0),
            //     id: song.id,
            //     type: ArtworkType.AUDIO),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        //////////////////////////////////////////
                        child: Text(
                          "song Name",
                          // song.title,
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        /////////////////////////////////
                        child: Text(
                          maxLines: 1,
                          "Artist Name",
                          // song.artist ?? "",
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
