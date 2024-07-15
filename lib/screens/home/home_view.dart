part of 'home_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (_, current) {
        return current is HomeInitializedState;
      },
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        if (!cubit.isInitialized) {
          return const Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: CircularProgressIndicator(
                color: AppThemes.fontMain,
              ),
            ),
          );
        }
        return Scaffold(
          resizeToAvoidBottomInset: context.watch<HomeCubit>().stretchedController.ratio == 0,
          body: SafeArea(
            child: StretchedContainer(
              controller: cubit.stretchedController,
              fillChild: const HomeCommentsSection(),
              onDrag: (controller) {
                cubit.setOpacity(controller.ratioReversed);
              },
              onAdjust: (controller) {
                cubit.setOpacity(controller.ratioReversed);
                cubit.onScreenAdjusted();
              },
              child: const HomeVideoSection(),
            ),
          ),
        );
      },
    );
  }
}
