import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/assistirFilmes.dart';
import 'package:flutter_application_1/assistirSeries.dart';
import 'package:flutter_application_1/filmeAvatar.dart';
import 'package:flutter_application_1/seriesComponents.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/serieSaul.dart';

// ignore: must_be_immutable
class VerDepois extends StatefulWidget {
  @override
  _VerDepoisState createState() => _VerDepoisState();
}

class _VerDepoisState extends State<VerDepois> {
  List<String> imageUrlsMovies = [
    'https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BZDE3NDZmMGUtZjhjOS00MmIyLTkyMzAtMzM4ZjNhZThiY2ViXkEyXkFqcGdeQXVyMTUzMDUzNTI3._V1_.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/d/d2/Top_Gun_Maverick.jpg',
    'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_FMjpg_UX1000_.jpg',
  ];

  List<String> imageUrlsSeries = [
    'https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_FMjpg_UX1000_.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/2/29/Stranger_Things_Temporada_1_Poster.jpg',
  ];

  void updateSeriesCarousel(bool isPopulares) {
    setState(() {
      if (isPopulares) {
        imageUrls = imageUrlsMovies;
      } else {
        imageUrls = imageUrlsSeries;
      }
    });
  }

  bool isFilmesLancamentosActive = true;
  bool isFilmesPopularesActive = false;

  int _selectedIndex = 3;

  void _onItemTapped(int index, BuildContext context) {
    if (index != _selectedIndex) {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.popUntil(context, ModalRoute.withName('/'));

          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AssistirFilmes()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AssistirSeries()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VerDepois()),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black12,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'DAW',
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: '.tv',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Ver Depois',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    updateSeriesCarousel(true);
                    setState(() {
                      isFilmesLancamentosActive = true;
                      isFilmesPopularesActive = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFilmesLancamentosActive
                        ? Color(0xFFFF8A00)
                        : Colors.blueGrey.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Filmes',
                    style: TextStyle(
                      color: isFilmesLancamentosActive
                          ? Colors.black
                          : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    updateSeriesCarousel(false);
                    setState(() {
                      isFilmesLancamentosActive = false;
                      isFilmesPopularesActive = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFilmesPopularesActive
                        ? Color(0xFFFF8A00)
                        : Colors.blueGrey.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Series',
                    style: TextStyle(
                      color:
                          isFilmesPopularesActive ? Colors.black : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      int movieIndex =
                          imageUrlsMovies.indexOf(imageUrls[index]);
                      int seriesIndex =
                          imageUrlsSeries.indexOf(imageUrls[index]);

                      if (movieIndex != -1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilmeAvatar(
                              imageUrl: imageUrls[index],
                            ),
                          ),
                        );
                      } else if (seriesIndex != -1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SerieSaul(
                              imageUrl: imageUrls[index],
                            ),
                          ),
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: imageUrls[index],
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey.shade900,
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade600,
          currentIndex: _selectedIndex,
          onTap: (index) => _onItemTapped(index, context),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Filmes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: 'Séries',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              label: 'Ver Depois',
            ),
          ],
        ),
      ),
    );
  }
}
