import 'package:favorite_button/favorite_button.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:techcrunch_bloc_api/ui/techwebview.dart';

import '../bloc/bloc/techcrunch_bloc.dart';
import '../data/model/data.dart';
import 'bookmark_page.dart';
import 'home_screen.dart';

class DetailScreen extends StatefulWidget {
  final TechcrunchData techcrunchData;
  const DetailScreen({
    Key? key,
    required this.techcrunchData,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<TechcrunchBloc>(context),
                    child: HomeScreen(),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Details Screen",
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TechcrunchWebview(
                        url: widget.techcrunchData.link,
                        techcrunchData: widget.techcrunchData,
                      ),
                    ),
                  );
                  ;
                },
                child: Stack(
                  children: [
                    Container(
                      height: 200.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.techcrunchData.jetpackFeaturedMediaUrl,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: FavoriteButton(
                        isFavorite: _isFavorite,
                        iconColor: Colors.red,
                        iconDisabledColor: Colors.grey.shade200,
                        valueChanged: (_isFavorite) {
                          _isFavorite
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookMarkPage(
                                        techcrunchData: widget.techcrunchData),
                                  ),
                                )
                              : Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd – kk:mm')
                            .format(widget.techcrunchData.date),
                        style: GoogleFonts.lato(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        widget.techcrunchData.title.rendered,
                        style: GoogleFonts.lato(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        widget.techcrunchData.excerpt.rendered,
                        style: GoogleFonts.lato(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
