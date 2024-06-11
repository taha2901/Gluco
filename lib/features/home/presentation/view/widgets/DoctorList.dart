import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/home/presentation/manager/cubit/doctor_cubit.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorDetails.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DoctorssLoadingState) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is DoctorsSuccessState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: DoctorDetials(
                  docDetails: state.doctorModels[index],
                ),
              );
            },
            itemCount: state.doctorModels.length,
          );
        } else if (state is DoctorsErrorState) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.error)),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: Text('Unknown state')),
          );
        }
      },
    );
  }
}
