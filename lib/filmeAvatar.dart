import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/assistirFilmes.dart';
import 'package:flutter_application_1/assistirSeries.dart';
import 'package:flutter_application_1/main.dart';
import 'dart:math';

import 'package:flutter_application_1/serieSaul.dart';
import 'package:flutter_application_1/filmesComponents.dart';
import 'package:flutter_application_1/verDepois.dart';
import 'package:flutter_application_1/videoPlayer.dart';

class FilmeAvatar extends StatefulWidget {
  final String imageUrl;

  FilmeAvatar({required this.imageUrl});

  @override
  _FilmeAvatarState createState() => _FilmeAvatarState();
}

class _FilmeAvatarState extends State<FilmeAvatar> {
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
    // Gere um índice aleatório com base no comprimento da lista de URLs
    int randomIndex = Random().nextInt(imageUrls.length);
    // Retorne a URL da imagem correspondente ao índice gerado aleatoriamente
    return imageUrls[randomIndex];
  }

  void updateMoviesCarousel(bool isPopulares) {
    setState(() {
      if (isPopulares) {
        // Update the list of images with popular movies
        originalMovieImageUrls = popularMoviesImageUrls;
      } else {
        // Reset the list of images to the original movies list
        originalMovieImageUrls = [
          'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_FMjpg_UX1000_.jpg',
          'https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg',
          'https://upload.wikimedia.org/wikipedia/pt/d/d2/Top_Gun_Maverick.jpg',
          'https://m.media-amazon.com/images/M/MV5BOTZmMmY2MzctMjU2Yy00YjJlLTk1NjAtY2U4MmMxOWZkZWY4XkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_.jpg',
          // Add more URLs as needed
        ];
      }
    });
  }

  void updateSeriesCarousel(bool isPopulares) {
    setState(() {
      if (isPopulares) {
        // Update the list of images with popular series
        originalSerieImageUrls = popularSerieImageUrls;
      } else {
        // Reset the list of images to the original series list
        originalSerieImageUrls = [
          'https://m.media-amazon.com/images/M/MV5BZDA4YmE0OTYtMmRmNS00Mzk2LTlhM2MtNjk4NzBjZGE1MmIyXkEyXkFqcGdeQXVyMTMzNDExODE5._V1_FMjpg_UX1000_.jpg',
          'https://m.media-amazon.com/images/M/MV5BODRiMmVkZDAtMDA0NS00ZjI2LWExMWQtYjZkMGY1MGY1ZDliXkEyXkFqcGdeQXVyMTU1ODM3NTA2._V1_FMjpg_UX1000_.jpg',
          'https://occ-0-2794-2218.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABdDA92Vqwg98vILWMsRpfyLUQVAH9mfDp2EU5dythi4tp8KhgIvU8lYGiuJwvbkp9KLtqaHGcPC5uUMhR9vBMxvr4jsK.jpg',
          'https://m.media-amazon.com/images/M/MV5BYWE3MDVkN2EtNjQ5MS00ZDQ4LTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg',
          // Add more URLs as needed
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
          width: MediaQuery.of(context).size.width * 0.9, // Largura desejada
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

  @override
  Widget build(BuildContext context) {
    if (currentImageUrl.isEmpty) {
      // Se a URL atual estiver vazia, defina a primeira imagem aleatória
      currentImageUrl = getRandomImageUrl();
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'DAW',
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: '.tv',
                style: TextStyle(
                  fontSize: 10,
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
                        // Space for 'Ver depois' button
                        SizedBox(width: 24),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Call the function to toggle the icon
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
                        SizedBox(
                            width:
                                40), // Space between 'Ver depois' and 'Play' button
                        SizedBox(
                          width: 130,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Ação para o botão "Assistir"
                              // For instance, navigate to VerDepois
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
                        SizedBox(
                            width:
                                40), // Space between 'Play' and 'Info' button
                        Column(
                          children: [
                            SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {
                                // Call the method to show the bottom sheet
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
                      'Filmes Recomendados',
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
                            ).then((value) {
                              setState(() {
                                // Update the current image URL if it has changed
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
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Filmes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssistirFilmes()),
                );
              },
            ),
            ListTile(
              title: Text('Series'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssistirSeries()),
                );
              },
            ),
            ListTile(
              title: Text('Ver Depois'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerDepois()),
                );
              },
            ),
            // Adicione mais itens do menu conforme necessário
          ],
        ),
      ),
    );
  }
}
