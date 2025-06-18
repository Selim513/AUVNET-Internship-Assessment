import 'package:auvnet_flutter_assessment/core/uses_case.dart/use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/user_address/get_user_address_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/user_address/set_user_address_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/user_address_bloc/user_address_event.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/user_address_bloc/user_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAddressBloc extends Bloc<UserAddressEvent, UserAddressState> {
  final GetUserAddressUseCase getUserAddress;
  final SetUserAddressUseCase setUserAddres;
  UserAddressBloc(this.getUserAddress, this.setUserAddres)
    : super(const UserAddressState()) {
    on<UserAddressEvent>((event, emit) async {
      if (event is SetUserAddressEvent) {
        try {
          emit(state.copyWith(isLoading: true));
          await setUserAddres.call(address: event.address, userId: event.id);
          emit(
            state.copyWith(succMessage: 'address Changed', isLoading: false),
          );
        } catch (e) {
          emit(
            state.copyWith(
              isLoading: false,
              errMesagge: 'There is some thing went wrong: ${e.toString()}',
            ),
          );
        }
      } else if (event is GetUserAddressEvent) {
        try {
          emit(state.copyWith(isLoading: true));
          var address = await getUserAddress.call(NoParams());
          emit(state.copyWith(address: address, isLoading: false));
        } catch (e) {
          emit(state.copyWith(errMesagge: 'Error:${e.toString()}'));
        }
      }
    });
  }
}
