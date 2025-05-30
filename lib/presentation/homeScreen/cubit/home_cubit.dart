import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:pinterest/model/model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  int selectedPage = 1;

  List<Photo> photosList = [];

  HomeCubit() : super(HomeInitial()) {
    fetchdata(1);
  }

  fetchdata(int page) async {
    //print("function is woeking");
    if (state is HomeLoading) return;

    selectedPage = page;
    emit(HomeLoading());

    final url = "https://api.pexels.com/v1/curated?page=$page&per_page=10";
    const token = "L9d8M3itFrErAD5MbxCbMHWja51AS0kr1YqNzWSoj0NdG07MFCYEQEy8";
    final headers = {
      "Authorization": token,
      "content-Type": "application/json"
    };

    final responce = await http.get(Uri.parse(url), headers: headers);
    //print(responce.body);

    if (responce.statusCode == 200) {
      final data = photosFromJson(responce.body);

      photosList.addAll(data.photos);

      emit(
        HomeSuccess(
          data: Photos(
            page: selectedPage,
            perPage: data.perPage,
            totalResults: data.totalResults,
            nextPage: data.nextPage,
            photos: photosList,
          ),
        ),
      );
    } else {
      emit(HomeError(
          error: "Failed to load data. Status code:${responce.statusCode}"));
    }
  }
}
