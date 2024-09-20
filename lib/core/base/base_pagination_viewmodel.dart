import 'package:flutter/material.dart';
import 'package:generic_pagination/product/enum/pagination_state.dart';

abstract class PaginationViewModel<T> with ChangeNotifier {
  final int pageSize;
  List<T> items = [];
  int totalCount = 0;

  PaginationState _state = PaginationState.initial;
  PaginationState get state => _state;

  PaginationViewModel({this.pageSize = 6});

  set state(PaginationState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> loadFirstPage() async {
    items.clear();
    state = PaginationState.loadingFirstPage;
    try {
      final response = await fetchData(0);
      if (response?.isNotEmpty ?? false) {
        items = response ?? [];
        totalCount = getTotalCount();
        state = PaginationState.loaded;
      } else {
        state = PaginationState.noData;
      }
    } catch (e) {
      state = PaginationState.error;
    }
  }

  Future<void> loadMoreItems() async {
    if (state == PaginationState.loadingMoreItems ||
        state == PaginationState.endOfList) return;

    state = PaginationState.loadingMoreItems;

    try {
      final response = await fetchData(items.length);
      if (response?.isNotEmpty ?? false) {
        items.addAll(response ?? []);
        if (items.length >= totalCount) {
          state = PaginationState.endOfList;
        } else {
          state = PaginationState.loaded;
        }
      } else {
        state = PaginationState.endOfList;
      }
    } catch (e) {
      state = PaginationState.error;
    }
  }

  Future<List<T>?> fetchData(int pageIndex);

  int get count => _state == PaginationState.loadingMoreItems
      ? items.length + pageSize
      : state == PaginationState.loadingFirstPage
          ? pageSize
          : items.length;

  int getTotalCount();
}
