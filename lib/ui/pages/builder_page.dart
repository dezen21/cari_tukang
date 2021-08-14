part of 'pages.dart';

class BuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // note: HEADER
        Container(
          decoration: BoxDecoration(
              color: accentColor1,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
            if (userState is UserLoaded) {
              if (imageFileToUpload != null) {
                uploadImage(imageFileToUpload).then((downloadURL) {
                  imageFileToUpload = null;
                  context
                      .read<UserBloc>()
                      .add(UpdateData(profileImage: downloadURL));
                });
              }

              return GestureDetector(
                onTap: () {
                  context.read<PageBloc>().add(GoToProfilePage());
                },
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Stack(
                        children: <Widget>[
                          SpinKitFadingCircle(
                            color: accentColor2,
                            size: 50,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        (userState.user.profilePicture == null
                                            ? AssetImage("assets/user_pic.png")
                                            : NetworkImage(
                                                userState.user.profilePicture)),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              78,
                          child: Text(
                            userState.user.name,
                            style: whiteTextFont.copyWith(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: "id_ID",
                                  decimalDigits: 0,
                                  symbol: "IDR ")
                              .format(userState.user.balance),
                          style: whiteNumberFont.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
              );
            } else {
              return SpinKitFadingCircle(
                color: accentColor2,
                size: 50,
              );
            }
          }),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 12),
          child: Text(
            "Available",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 24,
              ),
              GestureDetector(
                onTap: () {
                  context.read<PageBloc>().add(GoToInteriorDetailPage());
                },
                child: AvailableCard(Available(
                    id: 1,
                    name: 'Interior Design',
                    imageUrl: 'assets/available_interior.png')),
              ),
              SizedBox(
                width: 24,
              ),
              GestureDetector(
                onTap: () {
                  context.read<PageBloc>().add(GoToKitchensetDetailPage());
                },
                child: AvailableCard(
                  Available(
                      id: 2,
                      name: 'Kitchen Set',
                      imageUrl: 'assets/available_kitchenset.png'),
                ),
              ),
              SizedBox(
                width: 24,
              )
            ],
          ),
        ),
        SizedBox(
          height: 22,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
          child: Text(
            "Category",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  context.read<PageBloc>().add(GoToInteriorDetailPage());
                },
                child: CategoryCard(Available(
                    id: 1,
                    imageUrl: 'assets/interior_design.png',
                    name: 'Interior Design')),
              ),
              SizedBox(
                width: 35,
              ),
              GestureDetector(
                onTap: () {
                  context.read<PageBloc>().add(GoToKitchensetDetailPage());
                },
                child: CategoryCard(Available(
                    id: 2,
                    imageUrl: 'assets/kitchen_set.png',
                    name: 'Kitchen Set')),
              ),
              SizedBox(
                width: 35,
              ),
              CategoryCard(Available(
                  id: 3, imageUrl: 'assets/furniture.png', name: 'Furniture')),
              SizedBox(
                width: 35,
              ),
              CategoryCard(Available(
                  id: 2,
                  imageUrl: 'assets/swimming_pool.png',
                  name: 'Swimming Pool')),
            ],
          ),
        ),

        // note: GET LUCKY DAY
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 12),
          child: Text(
            "Get Lucky Day",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: dummyPromos
              .map((e) => Padding(
                  padding:
                      EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
                  child: PromoCard(e)))
              .toList(),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
