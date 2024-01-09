import 'package:flutter/material.dart';
import 'package:flutter_application_1/assistirSeries.dart';
import 'package:flutter_application_1/filmeAvatar.dart';
import 'package:flutter_application_1/verDepois.dart';
import 'package:flutter_application_1/filmesComponents.dart';
import 'filmesComponents.dart';

class AssistirFilmes extends StatefulWidget {
  @override
  _AssistirFilmesState createState() => _AssistirFilmesState();
}

class _AssistirFilmesState extends State<AssistirFilmes> {
  List<String> imageUrls = [
    'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/d/d2/Top_Gun_Maverick.jpg',
    'https://m.media-amazon.com/images/M/MV5BOTZmMmY2MzctMjU2Yy00YjJlLTk1NjAtY2U4MmMxOWZkZWY4XkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_.jpg',
    'https://m.media-amazon.com/images/S/pv-target-images/1ee8a6ef606669f6f55cfd0ae9e1c3d4ee515d9e82b1deb44eabe6d62ba802d5.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/thumb/9/95/Napoleon_poster.jpg/225px-Napoleon_poster.jpg',
  ];

  void updateSeriesCarousel(bool isPopulares) {
    setState(() {
      if (isPopulares) {
        imageUrls = originalMovieImageUrls;
      } else {
        imageUrls = popularMoviesImageUrls;
      }
    });
  }

  bool isFilmesLancamentosActive = true;
  bool isFilmesPopularesActive = false;

  int _selectedIndex = 1;

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
        backgroundColor: Colors.black,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Assistir Filmes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                        'Lançamentos',
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
                        'Populares',
                        style: TextStyle(
                          color: isFilmesPopularesActive
                              ? Colors.black
                              : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.center,
                children: List.generate(
                  imageUrls.length,
                  (index) => GestureDetector(
                    onTap: () {
                      int imageIndex =
                          originalMovieImageUrls.indexOf(imageUrls[index]);
                      if (imageIndex != -1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilmeAvatar(
                              imageUrl: imageUrls[imageIndex],
                            ),
                          ),
                        );
                      } else {
                        imageIndex =
                            popularMoviesImageUrls.indexOf(imageUrls[index]);
                        if (imageIndex != -1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FilmeAvatar(
                                imageUrl: imageUrls[imageIndex],
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: SizedBox(
                      width: 110,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
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
