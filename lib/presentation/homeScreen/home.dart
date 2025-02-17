import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest/presentation/homeScreen/cubit/home_cubit.dart';
import 'package:pinterest/presentation/homeScreen/widgets/tile.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final downloadar = MediaDownload();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return state is HomeLoading
              ? const Center(child: CircularProgressIndicator())
              : state is HomeSuccess
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  MasonryGridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    crossAxisSpacing: 8,
                                    itemCount: state.data.photos.length,
                                    mainAxisSpacing: 8,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          downloadar.downloadMedia(
                                              context,
                                              cubit.photosList[index].src
                                                  .original);
                                          // print("downloded");
                                        },
                                        child: Tile(
                                          index: index,
                                          url: cubit
                                              .photosList[index].src.original,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     cubit.fetchdata(cubit.selectedPage + 1);
                                  //   },
                                  //   child: const Text("Next >>"),
                                  // ),
                                  //const SizedBox(height: 20),

                                  SizedBox(
                                    height: 50,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(width: 20);
                                      },
                                      itemCount: 8,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        int value = index + 1;

                                        return InkWell(
                                          onTap: () {
                                            cubit.fetchdata(value);
                                          },
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: cubit.selectedPage == value
                                                  ? Colors.blue
                                                  : Colors.transparent,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              value.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : state is HomeError
                      ? Center(
                          child: Center(child: Text(state.error)),
                        )
                      : const Center(
                          child: Center(
                            child: Text("Somthing went Wrong"),
                          ),
                        );
        },
      ),
    );
  }
}
