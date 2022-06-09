import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<String>typeViewList=['assets/images/Single-view-icon.png','assets/images/grid-view-icon.png','assets/images/List-view-icon.png'];

  List<String>mealImages=['assets/images/04.png','assets/images/02.png','assets/images/03.png','assets/images/02.png','assets/images/04.png','assets/images/03.png'];

  List<String>mealNamesList=['Slow-Cooked Volcanic Terrier','Pickled Vinegar Cockles','Shallow-Fried Herbs & Chicken','Stewed Fennel & Orange Pie','Shallow-Fried Herbs & Chicken','Stewed Fennel & Orange Pie'];

  var selectList;
  List<bool> selectFavouriteMeal =List.filled(6, false) ;


  void changeContainerColor (int value){
    emit(UnSelectedIndexList());
    selectList=value;
    emit(SelectedIndexList());
  }

  void favouriteMeal (int value){
    emit(UnFavouriteMeal());
    selectFavouriteMeal[value] = !selectFavouriteMeal[value];

    emit(FavouriteMeal());
  }

}
