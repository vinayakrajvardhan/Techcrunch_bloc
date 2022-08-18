// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techcrunch_bloc_api/ui/second_screen.dart';

import '../data/model/data.dart';

class BookMarkPage extends StatefulWidget {
  final TechcrunchData techcrunchData;
  const BookMarkPage({
    Key? key,
    required this.techcrunchData,
  }) : super(key: key);

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "BookMark Screen",
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              GestureDetector(
                onTap: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                              techcrunchData: widget.techcrunchData)),
                    )),
                child: Container(
                  height: 200.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.techcrunchData.jetpackFeaturedMediaUrl,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
