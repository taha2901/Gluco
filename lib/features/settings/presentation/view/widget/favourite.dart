import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/settings/data/get_favourite/get_favourite.dart';
import 'package:gluco/features/settings/presentation/manager/fav_cubit/fav_cubit.dart';

class FavouriteDoctors extends StatelessWidget {
  const FavouriteDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetFavCubit, GetFavState>(
      listener: (context, state) {
        if (state is GetFavErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.error}')),
          );
        }
      },
      builder: (context, state) {
        if (state is GetFavLoadingState) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (state is GetFavSuccessState) {
          final List<GetFavourite> fav = state.favModels;
          return Scaffold(
            appBar: AppBar(
              title: const Text('الأطباء المفضلين'),
            ),
            body: ListView.builder(
              itemCount: fav.length,
              itemBuilder: (context, index) {
                return FavWidget(fav: fav[index]);
              },
            ),
          );
        } else {
          return const Scaffold(
              body: Center(child: Text('No favourites found.')));
        }
      },
    );
  }
}

class FavWidget extends StatelessWidget {
  const FavWidget({
    Key? key,
    required this.fav,
  }) : super(key: key);

  final GetFavourite fav;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(fav.doctor!.photo ?? ''),
        ),
        title: Text(
          fav.doctor!.userName ?? 'nnn',
          style: const TextStyle(backgroundColor: Colors.black),
        ),
        subtitle: Text(fav.doctor!.doctorspecialization ?? ''),
        onTap: () {},
      ),
    );
  }
}
