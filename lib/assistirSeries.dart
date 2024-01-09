import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/assistirFilmes.dart';
import 'package:flutter_application_1/serieSaul.dart';
import 'package:flutter_application_1/verDepois.dart';
import 'seriesComponents.dart';

class AssistirSeries extends StatefulWidget {
  @override
  _AssistirSeriesState createState() => _AssistirSeriesState();
}

class _AssistirSeriesState extends State<AssistirSeries> {
  List<String> imageUrls = [
    'https://m.media-amazon.com/images/M/MV5BZDA4YmE0OTYtMmRmNS00Mzk2LTlhM2MtNjk4NzBjZGE1MmIyXkEyXkFqcGdeQXVyMTMzNDExODE5._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BODRiMmVkZDAtMDA0NS00ZjI2LWExMWQtYjZkMGY1MGY1ZDliXkEyXkFqcGdeQXVyMTU1ODM3NTA2._V1_FMjpg_UX1000_.jpg',
    'https://occ-0-2794-2218.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABdDA92Vqwg98vILWMsRpfyLUQVAH9mfDp2EU5dythi4tp8KhgIvU8lYGiuJwvbkp9KLtqaHGcPC5uUMhR9vBMxvr4jsK.jpg',
    'https://m.media-amazon.com/images/M/MV5BYWE3MDVkN2EtNjQ5MS00ZDQ4LTliNzYtMjc2YWMzMDEwMTA3XkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMDQ2YjVmYTktMWM2ZS00MzM5LWE4MDgtNWE0ZTJjNmU5NjJlXkEyXkFqcGdeQXVyMTA3MzQ4MTc0._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BZGUzYTI3M2EtZmM0Yy00NGUyLWI4ODEtN2Q3ZGJlYzhhZjU3XkEyXkFqcGdeQXVyNTM0OTY1OQ@@._V1_FMjpg_UX1000_.jpg',
  ];

  void updateSeriesCarousel(bool isPopulares) {
    setState(() {
      if (isPopulares) {
        imageUrls = originalSerieImageUrls;
      } else {
        imageUrls = popularSerieImageUrls;
      }
    });
  }

  bool isSeriesLancamentosActive = true;
  bool isSeriesPopularesActive = false;

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
                  'Assistir Séries',
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
                          isSeriesLancamentosActive = true;
                          isSeriesPopularesActive = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSeriesLancamentosActive
                            ? Color(0xFFFF8A00)
                            : Colors.blueGrey.shade900,
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
                        updateSeriesCarousel(false);
                        setState(() {
                          isSeriesLancamentosActive = false;
                          isSeriesPopularesActive = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSeriesPopularesActive
                            ? Color(0xFFFF8A00)
                            : Colors.blueGrey.shade900,
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
                          originalSerieImageUrls.indexOf(imageUrls[index]);
                      if (imageIndex != -1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SerieSaul(
                              imageUrl: imageUrls[imageIndex],
                            ),
                          ),
                        );
                      } else {
                        imageIndex =
                            popularSerieImageUrls.indexOf(imageUrls[index]);
                        if (imageIndex != -1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SerieSaul(
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
