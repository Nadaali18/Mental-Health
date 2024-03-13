class LayoutCubit extends Cubit<Home_States>{

  LayoutCubit() : super(Initial_State());

  static LayoutCubit get(context) => BlocProvider.of(context);