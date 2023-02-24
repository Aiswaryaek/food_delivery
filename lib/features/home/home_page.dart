// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:delivery/models/category_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/ui_state.dart';
import '../../provider/dishes_provider.dart';
import '../../repositories/category_repositories.dart';
import '../../styles/colors.dart';
import '../../styles/textstyles.dart';
import '../../widgets/arrow_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DishesProvider dishesProvider =
  DishesProvider(categoryRepository: CategoryRepository());
  final controller = TextEditingController();
  final optionItems = <Category>[];
  int? selectedIndex = 1;
  int _itemCount = 0;
  dynamic _count = 1;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCounter() {
    if (_count < 2) {
      return;
    }
    setState(() {
      _count--;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    dishesProvider.checkGetDishes();
    optionItems.add(Category('Wall', Icons.list));
    optionItems.add(Category('Menu', Icons.local_dining));
    optionItems.add(Category('Videos', Icons.videocam_outlined));
    optionItems.add(Category('Reviews', Icons.star_border));
    optionItems.add(Category('Blog', Icons.message));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: arrowAppBar(controller),
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Transform.translate(
                      offset: const Offset(-0, -4),
                      child: SizedBox(
                        width: 70,
                        height: 170,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: NetworkImage(
                                'https://d27k8xmh3cuzik.cloudfront.net/wp-content/uploads/2018/12/og-for-street-food-in-sydney.jpg'),
                          ),
                        ),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.translate(
                          offset: const Offset(-9, 3),
                          child: Text('Taza Kitchen', style: mainText),
                        ),
                        SizedBox(
                          height: 23,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person_add,
                              size: 12,
                              color: whiteColor,
                            ),
                            label: Text(
                              'Follow',
                              style: followText,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: blackColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                )), // <-- Text
                          ),
                        )
                      ],
                    ),
                    subtitle: Transform.translate(
                      offset: const Offset(-9, 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2),
                          Text(
                            'From peyad',
                            style: subMainText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Member since Aug 16, 2021',
                                style: subheadMainText,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '4.6',
                                    style: ratingText,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: starColor,
                                    size: 16,
                                  )
                                ],
                              )
                            ],
                          ),
                          Text(
                            'FSSAI NO: 21321137000400',
                            style: subheadMainText,
                          ),
                          Text(
                            'Know more',
                            style: knowMoreText,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), //<-- SEE HERE
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: '14 ',
                                    style: richText,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Posts',
                                          style: headText,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => {})
                                    ])),
                            RichText(
                                text: TextSpan(
                                    text: '37 ',
                                    style: richText,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Followers',
                                          style: headText,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => {})
                                    ])),
                          ],
                        )),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 80,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: optionItems.length,
                        separatorBuilder: (context, _) =>
                        const SizedBox(width: 2),
                        itemBuilder: (context, index) =>
                            Container(
                              // height: 65,
                              width: 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ListTile(
                                      shape: RoundedRectangleBorder(
                                        //<-- SEE HERE
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      tileColor:
                                      selectedIndex == index ? starColor : null,
                                      title: Icon(
                                        optionItems[index].icon,
                                        color: blackColor,
                                        size: 25,
                                      ),
                                      subtitle: Column(
                                        children: [
                                          SizedBox(height: 8),
                                          Text(
                                            optionItems[index].text,
                                            style: subHeadText,
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            )),
                  ),
                  SizedBox(height: 4),
                  Divider(
                    color: grayColor,
                    thickness: 4,
                    height: 3,
                  ),
                  SizedBox(height: 4),
                  dishes(),
                ],
              )),
        ));
  }

  dishes() {
    return ChangeNotifierProvider<DishesProvider>(
      create: (ctx) {
        return dishesProvider;
      },
      child: Consumer<DishesProvider>(
        builder: (ctx, data, _) {
          var state = data.getDishesLiveData().getValue();
          print(state);
          if (state is IsLoading) {
            return SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 1.3,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            );
          } else if (state is Initial) {
            return Center(
              child: Text('Items cannot be found'),
            );
          } else if (state is Success) {
            return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                itemCount: data.list.length,
                separatorBuilder: (context, _) => const SizedBox(height: 9),
                itemBuilder: (context, index) =>
                    ExpansionTile(
                        title: Text(
                          '${data.list[index].categoryName}',
                          style: categoryText,
                        ),
                        children: data.list.map((userone) {
                          return ListTile(
                              title: Text(
                                  '${userone.products?[0]
                                      .kitchenItemName}'),
                            trailing:  Container(
                              width: 115,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: grayColor,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  _itemCount!=0? new  IconButton(icon: Icon(Icons.remove,color: greenButtonColor, size: 17),onPressed: ()=>setState(()=>_itemCount--),):new Container(),
                                  new Text(_itemCount.toString()),
                                  new IconButton(icon: new Icon(Icons.add,color: greenButtonColor, size: 17),onPressed: ()=>setState(()=>_itemCount++))
                                ],
                              ),
                            ),);
                        }).toList()));
          } else if (state is Failure) {
            return SizedBox(
              height: 80,
              child: Center(
                child: Text(
                  'No Dishes Found!!',
                  style: categoryText,
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
