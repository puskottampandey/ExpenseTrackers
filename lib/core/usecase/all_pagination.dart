class PaginationHandler {
  Map<String, String> paginationHandler({
    required int currentPage,
    String? searchSlug,
  }) {
    Map<String, String> param = {
      "page": currentPage.toString(),
      "perpage": "20",
    };

    if (searchSlug != null && searchSlug.isNotEmpty) {
      param['search'] = searchSlug;
    }

    return param;
  }

  int paginationCurrentPageParser(
      {required int currentPage, required dynamic res}) {
    return res['data']?['data']?['pagination']?['currentPage'] ?? currentPage;
  }
}
