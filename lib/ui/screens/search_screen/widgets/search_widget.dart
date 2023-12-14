import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/movie_bloc/movie_bloc.dart';
import '../../../../theme/my_colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required TextEditingController textController,
    required FocusNode textFocusNode,
  })  : _textController = textController,
        _textFocusNode = textFocusNode;

  final TextEditingController _textController;
  final FocusNode _textFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return Container(
          height: 40.0,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: MyColors.greyDark1,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: MyColors.white,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _textController,
                  focusNode: _textFocusNode,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: MyColors.white,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    color: MyColors.white,
                  ),
                  onChanged: (value) {
                    context
                        .read<MovieBloc>()
                        .add(GetSearchMoviesEvent(query: value));
                  },
                ),
              ),
              if (_textController.text.isNotEmpty)
                Material(
                  color: MyColors.greyDark3,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      _textController.clear();
                      context.read<MovieBloc>().add(RemoveSearchMoviesEvent());
                    },
                    child: const Icon(
                      Icons.clear,
                      color: MyColors.white,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
