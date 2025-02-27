// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersWithDeckCountsHash() =>
    r'7cfa135d36f82e07d8d3d8fd27168dcda973f4de';

/// Provider for users with deck counts for the leaderboard
///
/// Copied from [usersWithDeckCounts].
@ProviderFor(usersWithDeckCounts)
final usersWithDeckCountsProvider =
    AutoDisposeFutureProvider<List<AppUser>>.internal(
      usersWithDeckCounts,
      name: r'usersWithDeckCountsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$usersWithDeckCountsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UsersWithDeckCountsRef = AutoDisposeFutureProviderRef<List<AppUser>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
