part of 'home_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (_, current) {
          return true;
        },
        builder: (context, state) {
          return Center();
        },
      ),
    );
  }
}
