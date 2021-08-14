part of 'pages.dart';

class KitchensetDetail extends StatefulWidget {
  @override
  _KitchensetDetailState createState() => _KitchensetDetailState();
}

class _KitchensetDetailState extends State<KitchensetDetail> {
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future<void> handleBook(space) async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Apakah kamu ingin membooking pembuatan kitchenset?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Nanti',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Hubungi'),
                onPressed: () {
                  Navigator.of(context).pop();
                  launchUrl('tel://6282234685920');
                },
              ),
            ],
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            color: accentColor1,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // note: BACKDROP
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 280,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/available_kitchenset.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            height: 280,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment(0, 1),
                                    end: Alignment(0, 0.06),
                                    colors: [
                                  Colors.white,
                                  Colors.white.withOpacity(0)
                                ])),
                          )
                        ],
                      ),
                      // note: BACK ICON
                      Container(
                        margin: EdgeInsets.only(top: 20, left: defaultMargin),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04)),
                        child: GestureDetector(
                          onTap: () {
                            context.read<PageBloc>().add(GoToMainPage());
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  // note: JUDUL
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 16, defaultMargin, 6),
                    child: Text(
                      "Kitchen Set",
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // note: GENRE

                  SizedBox(
                    height: 6,
                  ),
                  // note: RATING
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffC4C4C4),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "8/10",
                        style: TextStyle(color: Color(0xffADADAD)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  // note: CREDITS
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin:
                            EdgeInsets.only(left: defaultMargin, bottom: 12),
                        child: Text(
                          "Tukang & Crew",
                          style: blackTextFont.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )),
                  ),
                  //Nama-nama Tukang
                  Container(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 24,
                        ),
                        TukangCard(Tukang(
                            id: 1,
                            name: 'Parno',
                            imageUrl: 'assets/tukang4.png')),
                        SizedBox(
                          width: 5,
                        ),
                        TukangCard(Tukang(
                            id: 1,
                            name: 'Sugeng',
                            imageUrl: 'assets/tukang5.png')),
                        SizedBox(
                          width: 5,
                        ),
                        TukangCard(Tukang(
                            id: 1,
                            name: 'Gito',
                            imageUrl: 'assets/tukang1.png')),
                        SizedBox(
                          width: 5,
                        ),
                        TukangCard(Tukang(
                            id: 1,
                            name: 'Waryo',
                            imageUrl: 'assets/tukang6.png')),
                      ],
                    ),
                  ),
                  // note: STORYLINE
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 10, defaultMargin, 8),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description",
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 0, defaultMargin, 30),
                    child: Text(
                      "Kitchen set is a term used to describe a modern kitchen, which consists of a kitchen set in the form of a cabinet to store household appliances, especially kitchen utensils. However, in general, a kitchen set is furniture that is made to facilitate the effective use of space in the kitchen.",
                      style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  // note: BUTTON
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        primary: mainColor,
                      ),
                      child: Text(
                        "Continue to Book",
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                      onPressed: () {
                        handleBook(widget);
                      }),
                  SizedBox(height: defaultMargin),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }
}
