import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum  InternetState {initial, connected, disconnected}

class InternetCubit extends Cubit<InternetState>{
  Connectivity _connectivity= Connectivity();
  StreamSubscription? streamSubscription;


  InternetCubit() : super(InternetState.initial){
    streamSubscription= _connectivity.onConnectivityChanged.listen((event) { 
      if (event==ConnectivityResult.mobile || event==ConnectivityResult.wifi) {
        emit(InternetState.connected);
      }
      else{
        emit(InternetState.disconnected);
      }
    });
  }
  @override
  Future<void> close() {
   streamSubscription?.cancel();
    return super.close();
  }

}
