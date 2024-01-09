import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/assistirFilmes.dart';
import 'package:flutter_application_1/serieSaul.dart';
import 'package:flutter_application_1/verDepois.dart';
import 'dart:math';

import 'assistirSeries.dart';
import 'filmeAvatar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentImageUrl = '';

  bool isFilmesLancamentosActive = true;
  bool isFilmesPopularesActive = false;

  bool isSeriesLancamentosActive = true;
  bool isSeriesPopularesActive = false;

  List<String> imageUrls = [
    'https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BZDE3NDZmMGUtZjhjOS00MmIyLTkyMzAtMzM4ZjNhZThiY2ViXkEyXkFqcGdeQXVyMTUzMDUzNTI3._V1_.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/d/d2/Top_Gun_Maverick.jpg',
    'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_FMjpg_UX1000_.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/2/29/Stranger_Things_Temporada_1_Poster.jpg',
  ];

  String getRandomImageUrl() {
    int randomIndex = Random().nextInt(imageUrls.length);

    return imageUrls[randomIndex];
  }

  List<String> originalMovieImageUrls = [
    'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/d/d2/Top_Gun_Maverick.jpg',
    'https://m.media-amazon.com/images/M/MV5BOTZmMmY2MzctMjU2Yy00YjJlLTk1NjAtY2U4MmMxOWZkZWY4XkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_.jpg',
    'https://m.media-amazon.com/images/S/pv-target-images/1ee8a6ef606669f6f55cfd0ae9e1c3d4ee515d9e82b1deb44eabe6d62ba802d5.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/thumb/9/95/Napoleon_poster.jpg/225px-Napoleon_poster.jpg',
  ];

  List<String> popularMoviesImageUrls = [
    'https://m.media-amazon.com/images/M/MV5BZDE3NDZmMGUtZjhjOS00MmIyLTkyMzAtMzM4ZjNhZThiY2ViXkEyXkFqcGdeQXVyMTUzMDUzNTI3._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BYzhiNDkyNzktNTZmYS00ZTBkLTk2MDAtM2U0YjU1MzgxZjgzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg',
    'https://image.tmdb.org/t/p/w500/cUgYrz4twiJ3QgVGpRfey984NIB.jpg',
    'https://m.media-amazon.com/images/M/MV5BNzcxNmIwMDYtNGQ4My00M2UxLWJlNTctM2Y2Y2FlYTE1NzAwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg',
    'https://m.media-amazon.com/images/S/pv-target-images/ae8dddd0abc2fac14052f29bc2ae15ddd86374c0d3bd017171ee6473b8933b29.jpg',
  ];

  List<String> originalSerieImageUrls = [
    'https://m.media-amazon.com/images/M/MV5BZDA4YmE0OTYtMmRmNS00Mzk2LTlhM2MtNjk4NzBjZGE1MmIyXkEyXkFqcGdeQXVyMTMzNDExODE5._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BODRiMmVkZDAtMDA0NS00ZjI2LWExMWQtYjZkMGY1MGY1ZDliXkEyXkFqcGdeQXVyMTU1ODM3NTA2._V1_FMjpg_UX1000_.jpg',
    'https://occ-0-2794-2218.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABdDA92Vqwg98vILWMsRpfyLUQVAH9mfDp2EU5dythi4tp8KhgIvU8lYGiuJwvbkp9KLtqaHGcPC5uUMhR9vBMxvr4jsK.jpg',
    'https://m.media-amazon.com/images/M/MV5BYWE3MDVkN2EtNjQ5MS00ZDQ4LTliNzYtMjc2YWMzMDEwMTA3XkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMDQ2YjVmYTktMWM2ZS00MzM5LWE4MDgtNWE0ZTJjNmU5NjJlXkEyXkFqcGdeQXVyMTA3MzQ4MTc0._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BZGUzYTI3M2EtZmM0Yy00NGUyLWI4ODEtN2Q3ZGJlYzhhZjU3XkEyXkFqcGdeQXVyNTM0OTY1OQ@@._V1_FMjpg_UX1000_.jpg',
  ];

  List<String> popularSerieImageUrls = [
    'https://m.media-amazon.com/images/M/MV5BM2EwMmRhMmUtMzBmMS00ZDQ3LTg4OGEtNjlkODk3ZTMxMmJlXkEyXkFqcGdeQXVyMjM5ODk1NDU@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMWYxNGJhNmQtZmI4OS00NjQ1LThmNzAtY2JkYmQ5NjliNDgwXkEyXkFqcGdeQXVyODc0OTEyNDU@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_FMjpg_UX1000_.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/2/29/Stranger_Things_Temporada_1_Poster.jpg',
    'https://m.media-amazon.com/images/M/MV5BN2IzYzBiOTQtNGZmMi00NDI5LTgxMzMtN2EzZjA1NjhlOGMxXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BNzI5MjUyYTEtMTljZC00NGI5LWFhNWYtYjY0ZTQ5YmEzMWRjXkEyXkFqcGdeQXVyMTY3MDE5MDY1._V1_FMjpg_UX1000_.jpg',
  ];

  void updateMoviesCarousel(bool isPopulares) {
    setState(() {
      if (isPopulares) {
        originalMovieImageUrls = popularMoviesImageUrls;
      } else {
        originalMovieImageUrls = [
          'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_FMjpg_UX1000_.jpg',
          'https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg',
          'https://upload.wikimedia.org/wikipedia/pt/d/d2/Top_Gun_Maverick.jpg',
          'https://m.media-amazon.com/images/M/MV5BOTZmMmY2MzctMjU2Yy00YjJlLTk1NjAtY2U4MmMxOWZkZWY4XkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_.jpg',
          'https://m.media-amazon.com/images/S/pv-target-images/1ee8a6ef606669f6f55cfd0ae9e1c3d4ee515d9e82b1deb44eabe6d62ba802d5.jpg',
          'https://upload.wikimedia.org/wikipedia/pt/thumb/9/95/Napoleon_poster.jpg/225px-Napoleon_poster.jpg',
        ];
      }
    });
  }

  void updateSeriesCarousel(bool isPopulares) {
    setState(() {
      if (isPopulares) {
        originalSerieImageUrls = popularSerieImageUrls;
      } else {
        originalSerieImageUrls = [
          'https://m.media-amazon.com/images/M/MV5BZDA4YmE0OTYtMmRmNS00Mzk2LTlhM2MtNjk4NzBjZGE1MmIyXkEyXkFqcGdeQXVyMTMzNDExODE5._V1_FMjpg_UX1000_.jpg',
          'https://m.media-amazon.com/images/M/MV5BODRiMmVkZDAtMDA0NS00ZjI2LWExMWQtYjZkMGY1MGY1ZDliXkEyXkFqcGdeQXVyMTU1ODM3NTA2._V1_FMjpg_UX1000_.jpg',
          'https://occ-0-2794-2218.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABdDA92Vqwg98vILWMsRpfyLUQVAH9mfDp2EU5dythi4tp8KhgIvU8lYGiuJwvbkp9KLtqaHGcPC5uUMhR9vBMxvr4jsK.jpg',
          'https://m.media-amazon.com/images/M/MV5BYWE3MDVkN2EtNjQ5MS00ZDQ4LTliNzYtMjc2YWMzMDEwMTA3XkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg',
          'https://m.media-amazon.com/images/M/MV5BMDQ2YjVmYTktMWM2ZS00MzM5LWE4MDgtNWE0ZTJjNmU5NjJlXkEyXkFqcGdeQXVyMTA3MzQ4MTc0._V1_.jpg',
          'https://m.media-amazon.com/images/M/MV5BZGUzYTI3M2EtZmM0Yy00NGUyLWI4ODEtN2Q3ZGJlYzhhZjU3XkEyXkFqcGdeQXVyNTM0OTY1OQ@@._V1_FMjpg_UX1000_.jpg',
        ];
      }
    });
  }

  int _selectedIndex = 0;

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
    if (currentImageUrl.isEmpty) {
      currentImageUrl = getRandomImageUrl();
    }
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(currentImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    width: 220,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF8A00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Assistir',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Assistir Filmes',
                      style: TextStyle(
                        color: Colors.black,
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
                            setState(() {
                              isFilmesLancamentosActive = true;
                              isFilmesPopularesActive = false;

                              updateMoviesCarousel(false);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isFilmesLancamentosActive
                                ? Color(0xFFFF8A00)
                                : Colors.black,
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
                            setState(() {
                              isFilmesLancamentosActive = false;
                              isFilmesPopularesActive = true;

                              updateMoviesCarousel(true);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isFilmesPopularesActive
                                ? Color(0xFFFF8A00)
                                : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Populares',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CarouselSlider(
                    items: originalMovieImageUrls.map((imageUrl) {
                      return GestureDetector(
                        onTap: () {
                          int index = originalMovieImageUrls.indexOf(imageUrl);
                          if (index != -1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FilmeAvatar(
                                  imageUrl: imageUrl,
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: false,
                      enableInfiniteScroll: true,
                      initialPage: 0,
                      viewportFraction: 0.3,
                      aspectRatio: 2.0,
                    ),
                  ),
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Assistir Series',
                      style: TextStyle(
                        color: Colors.black,
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
                            setState(() {
                              isSeriesLancamentosActive = true;
                              isSeriesPopularesActive = false;

                              updateSeriesCarousel(false);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isSeriesLancamentosActive
                                ? Color(0xFFFF8A00)
                                : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Lançamentos',
                            style: TextStyle(
                              color: isSeriesLancamentosActive
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
                            setState(() {
                              isSeriesLancamentosActive = false;
                              isSeriesPopularesActive = true;

                              updateSeriesCarousel(true);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isSeriesPopularesActive
                                ? Color(0xFFFF8A00)
                                : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Populares',
                            style: TextStyle(
                              color: isSeriesPopularesActive
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CarouselSlider(
                    items: originalSerieImageUrls.map((imageUrl) {
                      return GestureDetector(
                        onTap: () {
                          int index = originalSerieImageUrls.indexOf(imageUrl);
                          if (index != -1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SerieSaul(imageUrl: imageUrl)),
                            );
                          }
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: false,
                      enableInfiniteScroll: true,
                      initialPage: 0,
                      viewportFraction: 0.3,
                      aspectRatio: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
