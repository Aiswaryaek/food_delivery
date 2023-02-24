import 'package:flutter/material.dart';

import '../core/live_data.dart';
import '../core/ui_state.dart';
import '../models/dishes_model.dart';
import '../repositories/category_repositories.dart';

class DishesProvider extends ChangeNotifier {
  CategoryRepository categoryRepository;
  DishesProvider({required this.categoryRepository});

  // var getDishes = DishesModel();
  List<Datum>list = [];
  LiveData<UIState<Datum>> getDishesDatas =
  LiveData<UIState<Datum>>();

  LiveData<UIState<Datum>> getDishesLiveData() {
    return this.getDishesDatas;
  }

  void initialState()
  {
    getDishesDatas.setValue(Initial());
    notifyListeners();
  }

  Future<void> checkGetDishes() async {
    try {
      getDishesDatas.setValue(IsLoading());
      list = await categoryRepository.getDishesData();
      if (list.isNotEmpty) {
        getDishesDatas.setValue(Success(Datum()));
      } else {
        getDishesDatas.setValue(IsEmpty());
      }
    } catch (ex) {
      getDishesDatas.setValue(Failure(ex.toString()));
    } finally {
      notifyListeners();
    }
    // return true;
  }
}