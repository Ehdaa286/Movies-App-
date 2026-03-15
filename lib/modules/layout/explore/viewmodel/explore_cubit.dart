import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_movies_list_usecase.dart';
import 'explore_states.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final GetMoviesListUseCase getMoviesListUseCase;

  ExploreCubit(this.getMoviesListUseCase) : super(ExploreInitial());

  Future<void> loadMoviesByGenre(String genre) async {
    if (isClosed) return;
    emit(ExploreLoading());
    try {
      final movies = await getMoviesListUseCase.call(genre: genre);
      if (isClosed) return;
      emit(ExploreLoaded(movies));
    } catch (e) {
      if (isClosed) return;
      emit(ExploreError(e.toString()));
    }
  }
}