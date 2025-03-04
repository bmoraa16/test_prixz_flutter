import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_prix/core/di/injection.dart';
import 'package:prueba_prix/features/book_search/domain/entities/doc.dart';
import 'package:prueba_prix/features/book_search/presentation/bloc/book_search_bloc.dart';

class BookSearchPage extends StatefulWidget {
  const BookSearchPage({super.key});

  @override
  State<BookSearchPage> createState() => _BookSearchPageState();
}

class _BookSearchPageState extends State<BookSearchPage> {
  late BookSearchBloc _bookSearchBloc;
  final TextEditingController _controller = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _bookSearchBloc = getIt<BookSearchBloc>()
      ..add(const BookSearchInitializeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bookSearchBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Búsqueda de Libros'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocBuilder<BookSearchBloc, BookSearchState>(
                builder: (context, state) {
                  bool isLoading = false;
                  if (state is BookSearchLoaded) {
                    isLoading = state.isLoading;
                  }

                  return TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Escribe para buscar...',
                      border: const OutlineInputBorder(),
                      suffixIcon: isLoading
                          ? const CupertinoActivityIndicator()
                          : _controller.text.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    _controller.clear();
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                  ),
                                )
                              : const Icon(
                                  Icons.search,
                                ),
                    ),
                    onChanged: (value) {
                      _debounceTimer?.cancel();
                      _debounceTimer = Timer(
                        const Duration(milliseconds: 350),
                        () {
                          context
                              .read<BookSearchBloc>()
                              .add(BookSearchQueryEvent(value));
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<BookSearchBloc, BookSearchState>(
                  builder: (context, state) {
                    if (state is BookSearchError) {
                      return Center(
                        child: Text('Error: ${state.message}'),
                      );
                    }
                    if (state is BookSearchLoaded) {
                      final books = state.books;
                      if (books.isEmpty && !state.isLoading) {
                        return const Center(child: Text('Sin resultados'));
                      }
                      return ListView.builder(
                        itemCount: books.length,
                        itemBuilder: (context, index) {
                          final Doc book = books[index];
                          return ListTile(
                            title: Text(book.title ?? 'Sin título'),
                            subtitle: Text(
                              book.authorName?.join(', ') ??
                                  'Autor desconocido',
                            ),
                            onTap: () {
                              debugPrint('Seleccionaste: ${book.title}');
                            },
                          );
                        },
                      );
                    }

                    return const Center(child: Text('Inicia tu búsqueda'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
