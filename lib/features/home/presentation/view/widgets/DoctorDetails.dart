import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
import 'package:gluco/features/home/presentation/view/widgets/confirm_reservation.dart';
import 'package:gluco/features/home/presentation/view/widgets/cusrom_button.dart';
import 'package:gluco/features/settings/presentation/manager/fav_cubit/fav_cubit.dart';

class DoctorDetials extends StatelessWidget {
  const DoctorDetials(
      {super.key, required this.docDetails, required this.doctorId});
  final DoctorModel docDetails;
  final int doctorId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return Stack(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.only(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(docDetails.photo.toString()),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(docDetails.userName.toString()),
                              Text(docDetails.doctorspecialization.toString()),
                              const Text('4.1  تقييم الزوار'),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.location_on_sharp,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(docDetails.address.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(docDetails.appointment.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.shopping_cart_checkout_sharp,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('سعر الكشف:  ${docDetails.detectionPrice} ج'),
                      ],
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.timer_outlined,
                          size: 15,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('مده الانتظار: 20 دقيقه'),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomButtonHome(
                      width: double.infinity,
                      borderRadius: 0.0,
                      text: 'احجز',
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ConfirmReservation(
                              showDoc: docDetails,
                              doctorId: doctorId,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.favorite_outline,
                  // color: FavCubit.get(context)
                  //         .favoriteID
                  //         .contains(docDetails.id.toString())
                  //     ? Colors.red
                  //     : Colors.grey,
                  color: Colors.red,
                ),
                onPressed: () {
                  FavCubit.get(context)
                      .addFavDoctor(doctorId: docDetails.id.toString());
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
