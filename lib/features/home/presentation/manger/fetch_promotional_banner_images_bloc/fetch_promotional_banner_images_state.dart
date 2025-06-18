import 'package:equatable/equatable.dart';

 enum BlocStatus  { initial, loading, success, failure }

class BannerState extends Equatable {
  final BlocStatus  status;
  final List<String> bannerImages;
  final String? errorMessage;
  final bool isLoading;

  const BannerState({
    this.isLoading = false,
    this.status = BlocStatus .initial,
    this.bannerImages = const [],
    this.errorMessage,
  });

  BannerState copyWith({
    bool? isLoading,
    BlocStatus ? status,
    List<String>? bannerImages,
    String? errorMessage,
  }) {
    return BannerState(
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      bannerImages: bannerImages ?? this.bannerImages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, bannerImages, errorMessage];

  @override
  String toString() {
    return 'BannerState(status: $status, bannerImages: ${bannerImages.length}, errorMessage: $errorMessage)';
  }
}
