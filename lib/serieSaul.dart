import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/assistirFilmes.dart';
import 'package:flutter_application_1/assistirSeries.dart';
import 'package:flutter_application_1/main.dart';
import 'dart:math';

import 'package:flutter_application_1/filmeAvatar.dart';

class SerieSaul extends StatefulWidget {
  final String imageUrl;

  SerieSaul({required this.imageUrl});

  @override
  _SerieSaulState createState() => _SerieSaulState();
}

class _SerieSaulState extends State<SerieSaul> {
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
    // Adicione mais URLs conforme necessário
  ];

  String getRandomImageUrl() {
    // Gere um índice aleatório com base no comprimento da lista de URLs
    int randomIndex = Random().nextInt(imageUrls.length);
    // Retorne a URL da imagem correspondente ao índice gerado aleatoriamente
    return imageUrls[randomIndex];
  }

  List<String> originalMovieImageUrls = [
    'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/d/d2/Top_Gun_Maverick.jpg',
    'https://m.media-amazon.com/images/M/MV5BOTZmMmY2MzctMjU2Yy00YjJlLTk1NjAtY2U4MmMxOWZkZWY4XkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_.jpg',
    // Adicione mais URLs conforme necessário
  ];

  List<String> popularMoviesImageUrls = [
    'https://m.media-amazon.com/images/M/MV5BZDE3NDZmMGUtZjhjOS00MmIyLTkyMzAtMzM4ZjNhZThiY2ViXkEyXkFqcGdeQXVyMTUzMDUzNTI3._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BYzhiNDkyNzktNTZmYS00ZTBkLTk2MDAtM2U0YjU1MzgxZjgzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg',
    'https://image.tmdb.org/t/p/w500/cUgYrz4twiJ3QgVGpRfey984NIB.jpg',
    // Adicione mais URLs conforme necessário
  ];

  List<String> originalSerieImageUrls = [
    'https://m.media-amazon.com/images/M/MV5BZDA4YmE0OTYtMmRmNS00Mzk2LTlhM2MtNjk4NzBjZGE1MmIyXkEyXkFqcGdeQXVyMTMzNDExODE5._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BODRiMmVkZDAtMDA0NS00ZjI2LWExMWQtYjZkMGY1MGY1ZDliXkEyXkFqcGdeQXVyMTU1ODM3NTA2._V1_FMjpg_UX1000_.jpg',
    'https://occ-0-2794-2218.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABdDA92Vqwg98vILWMsRpfyLUQVAH9mfDp2EU5dythi4tp8KhgIvU8lYGiuJwvbkp9KLtqaHGcPC5uUMhR9vBMxvr4jsK.jpg',
    'https://m.media-amazon.com/images/M/MV5BYWE3MDVkN2EtNjQ5MS00ZDQ4LTliNzYtMjc2YWMzMDEwMTA3XkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg',
    // Adicione mais URLs conforme necessário
  ];

  List<String> popularSerieImageUrls = [
    'https://m.media-amazon.com/images/M/MV5BM2EwMmRhMmUtMzBmMS00ZDQ3LTg4OGEtNjlkODk3ZTMxMmJlXkEyXkFqcGdeQXVyMjM5ODk1NDU@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMWYxNGJhNmQtZmI4OS00NjQ1LThmNzAtY2JkYmQ5NjliNDgwXkEyXkFqcGdeQXVyODc0OTEyNDU@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_FMjpg_UX1000_.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/2/29/Stranger_Things_Temporada_1_Poster.jpg',
    // Adicione mais URLs conforme necessário
  ];

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

  void _showInfoBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor:
              0.35, // Reduzindo a altura do BottomSheet para 30% da tela
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 55),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Additional Information',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Insert your additional information here...',
                          style: TextStyle(fontSize: 16),
                        ),
                        // Add more widgets for additional information
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        25), // Espaço entre o final do conteúdo e o final da tela
              ],
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
                      // Other widgets or content
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
                            SizedBox(height: 4),
                            Icon(
                              Icons.add,
                              color: Colors.orange,
                              size: 24,
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
                      'Series Recomendadas',
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
                  ),
                  SizedBox(height: 20),
                  CarouselSlider(
                    items: originalSerieImageUrls.map((imageUrl) {
                      return GestureDetector(
                        onTap: () {
                          // Verifica a URL da imagem e navega para a página correspondente
                          int index = originalSerieImageUrls.indexOf(imageUrl);
                          if (index != -1) {
                            // Navega para a página SerieSaul e passa a URL da imagem correspondente
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SerieSaul(imageUrl: imageUrl)),
                            );
                          }
                        },
                        child: Container(
                          width: 120,
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
            // Adicione mais itens do menu conforme necessário
          ],
        ),
      ),
    );
  }
}
