import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/assistirFilmes.dart';
import 'package:flutter_application_1/assistirSeries.dart';
import 'package:flutter_application_1/seriesComponents.dart';
import 'package:flutter_application_1/main.dart';
import 'dart:math';

import 'package:flutter_application_1/filmeAvatar.dart';
import 'package:flutter_application_1/verDepois.dart';
import 'package:flutter_application_1/videoPlayer.dart';

class SerieSaul extends StatefulWidget {
  final String imageUrl;

  SerieSaul({required this.imageUrl});

  @override
  _SerieSaulState createState() => _SerieSaulState();
}

class _SerieSaulState extends State<SerieSaul> {
  bool isAdded = false;

  void toggleIcon() {
    setState(() {
      isAdded = !isAdded;
    });
  }

  String currentImageUrl = '';

  bool isFilmesLancamentosActive = true;
  bool isFilmesPopularesActive = false;

  bool isSeriesLancamentosActive = true;
  bool isSeriesPopularesActive = false;

  String getRandomImageUrl() {
    int randomIndex = Random().nextInt(imageUrls.length);

    return imageUrls[randomIndex];
  }

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
          'https://m.media-amazon.com/images/M/MV5BYWE3MDVkN2EtNjQ5MS00ZDQ4LTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg',
        ];
      }
    });
  }

  List<Widget> generateStarIcons(int count) {
    return List.generate(
      count,
      (index) => Icon(Icons.star),
    );
  }

  void _showInfoBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: FractionallySizedBox(
            heightFactor: 0.30,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Info',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '2018',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time),
                          SizedBox(width: 5),
                          Text(
                            '50min',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '9.2',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: '/10',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5),
                          ...generateStarIcons(4),
                          Icon(Icons.star_half),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquam turpis eget lectus aliquet, eget eleifend ipsum lobortis. Phasellus auctor tristique eros at rhoncus.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  int _selectedIndex = 2;

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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AssistirSeries()),
            );
          },
        ),
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
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 24),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                toggleIcon();
                              },
                              child: isAdded
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.orange,
                                      size: 24,
                                    )
                                  : Icon(
                                      Icons.add,
                                      color: Colors.orange,
                                      size: 24,
                                    ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Ver depois',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 40),
                        SizedBox(
                          width: 130,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LocalVideoPlayer()),
                              );
                            },
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
                        SizedBox(width: 40),
                        Column(
                          children: [
                            SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {
                                _showInfoBottomSheet();
                              },
                              child: Icon(
                                Icons.info,
                                color: Colors.orange,
                                size: 24,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Info',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        // Space for 'Info' button
                        SizedBox(width: 24),
                      ],
                    ),
                  ),
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
                      'Series Recomendadas',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    SerieSaul(imageUrl: imageUrl),
                              ),
                            ).then((value) {
                              setState(() {
                                currentImageUrl = value ?? currentImageUrl;
                              });
                            });
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
