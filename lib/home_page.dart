import 'package:GUDANGPROJECT/constant/constant_color.dart';
import 'package:GUDANGPROJECT/constant/constant_style.dart';
import 'package:GUDANGPROJECT/model/CarouselModel.dart';
import 'package:GUDANGPROJECT/model/Popular_model.dart';
import 'package:GUDANGPROJECT/widget/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class HomePage extends StatefulWidget {
  int _current = 0;
  @override
  _HomePageState createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroudnColor,
        title: SvgPicture.asset('assets/svg/ihp_logo.svg'),
      ),

      backgroundColor: mBackgroudnColor,
      bottomNavigationBar: Bottom_nav(),

      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[

            //SESI PROMOSI
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 20, top: 14),
              child: Text(
              'Hi, Bro. Ini Promosi untukmu !',
              style: mTitleStyle ,),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index){
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index){
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(carousels[index].image,
                              ),
                              fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: map<Widget>(carousels, (index, image){
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 6,
                            width: 6,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                ? mBlueColor
                                  :mGreyColor),
                          );
                        },),
                      ),

                      //Lihat selengkapnya
                      Text(
                        'Lihat Selengkapnya...',
                        style: mMorediscountstyle,
                      )
                    ],
                  )
                ],
              ),
            ),

            //Service section
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 10),
              child: Text(
                'Pilihan Container',
                style: mTitleStyle ,),
            ),
            Container(
              height: 144,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor,width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                  'asset/',
                              fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('40 Feet', style: mServiceTitleStyle,),
                                    Text('Lihat selengkapnya...', style: mServiceSubtitleStyle,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor,width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'asset/',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('20 Feet', style: mServiceTitleStyle,),
                                    Text('Lihat selengkapnya...', style: mServiceSubtitleStyle,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor,width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'asset/',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('60 Feet', style: mServiceTitleStyle,),
                                    Text('Lihat selengkapnya...', style: mServiceSubtitleStyle,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor,width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'asset/',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('10 Feet', style: mServiceTitleStyle,),
                                    Text('Lihat selengkapnya...', style: mServiceSubtitleStyle,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Menu 2 section
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 10),
              child: Text(
                'Pilihan Container Menu 3',
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 140,
              child: ListView.builder(
                itemCount: populars.length,
                padding: EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      height: 140,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mBorderColor, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                        child: Column(
                          children: <Widget>[
                            Image.asset(populars[index].image, height: 74,),
                            Text(populars[index].nama, style: mPopularDestinationTitleStyle,),
                            Text(populars[index].keterangan, style: mPopularDestinationSubtitleStyle,)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 10),
              child: Text(
                'Container Log\'\s',
                style: mTitleStyle,
              ),
            ),
            // log session
          ],
        ),
      ),
    );
  }
}