import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techcrunch_bloc_api/ui/second_screen.dart';
import '../bloc/bloc/techcrunch_bloc.dart';
import '../data/model/data.dart';
import '../elements/error.dart';

import '../elements/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();
  TechcrunchBloc? techcrunchBloc;
  final List<TechcrunchData> _techData = [];

  @override
  void initState() {
    techcrunchBloc = BlocProvider.of<TechcrunchBloc>(context);
    techcrunchBloc?.add(FetchTechcrunchEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "First Screen",
            style: GoogleFonts.lato(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: BlocBuilder<TechcrunchBloc, TechcrunchState>(
              builder: (context, state) {
            if (state is TechcrunchInitial) {
              return buildLoading();
            } else if (state is TechcrunchLoadingState) {
              return buildLoading();
            } else if (state is TechCrunchLoadedState) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.techcrunchData.length,
                  controller: scrollController
                    ..addListener(() {
                      if (scrollController.offset ==
                              scrollController.position.maxScrollExtent &&
                          !context.read<TechcrunchBloc>().isFetching) {
                        context.read<TechcrunchBloc>()..isFetching = true;
                      }
                    }),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      techcrunchData:
                                          state.techcrunchData[index]),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                height: 200.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      state.techcrunchData[index]
                                          .jetpackFeaturedMediaUrl,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 240.w,
                            child: Text(
                              state.techcrunchData[index].title.rendered,
                              style: GoogleFonts.lato(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else if (state is TechCrunchErrorState) {
              return buildError(state.message);
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
