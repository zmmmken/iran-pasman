import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranpasman/home/home_repository.dart';
import 'package:iranpasman/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  Category category;


  CategoryItem(this.category);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool isCollapse = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return temp(widget.category,size);
  }

  Widget item(Category category, var size) {
    if (category.childs.length == 0) {
      return ListTile(
        title: Text(category.title),
      );
    } else if (category.childs.length > 0 && isCollapse) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 700),
          child: isCollapse
              ? InkWell(
            onTap: (){
              setState(() {
                isCollapse = !isCollapse;
              });
            },
                child: Ink(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Row(
                children: [
                  Text(category.title)
                ],
            ),
          ),
              )
              : ListView.builder(
              itemCount: category.childs.length +1,
              itemBuilder: (context, index) {
                if(index == 0){
                  return InkWell(
                    onTap: (){
                      setState(() {
                        isCollapse = !isCollapse;
                      });
                    },
                    child: Ink(
                      width: size.width,
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        children: [
                          Text(category.title)
                        ],
                      ),
                    ),
                  );
                }else{
                  return CategoryItem(category.childs[index-1]);
                }
          }));
    }
  }

  Widget temp(Category category, var size){
    if(category.childs.length==0 || isCollapse){
    return ListTile(
      title: Text(category.title),
      trailing: ShowDoneIcon(category),
      onTap: (){
        setState(() {
          selectCategory(category);
        });
      },
    );}
    else return Column(
      children: [
        ListTile(
          title: Text(category.title),
          trailing: Icon(Icons.arrow_drop_down,color: Colors.black.withOpacity(0.3),),
          onTap: (){
            setState(() {
              isCollapse = !isCollapse;
            });
          },
        ),
        ...category.childs.map((e) => Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Container(
                  width: 5,
                  height: 15,
                  decoration: ShapeDecoration(
                      color: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )

                  ),

                ),
              ),
              Expanded(child: CategoryItem(e)),
            ],
          ),
        )).toList()
      ],
    );
  }

  Icon ShowDoneIcon(Category category){
    HomeRepository repository = RepositoryProvider.of<HomeRepository>(context);
    if(repository.tempSelectedCategory.contains(category)){
      return Icon(Icons.done,size: 15,color: Colors.orangeAccent,);
    }else if(category.childs.length == 0){
      return Icon(Icons.add,size: 15,color: Colors.black.withOpacity(.4),);
    }else return Icon(Icons.arrow_drop_down, size: 15,color: Colors.black.withOpacity(.4),);
  }

  selectCategory(Category category){
    HomeRepository repository = RepositoryProvider.of<HomeRepository>(context);
    if(category.childs.length > 0){
      setState(() {
        isCollapse = !isCollapse;
      });
    }else if(repository.tempSelectedCategory.contains(category)){
      setState(() {
        repository.tempSelectedCategory.remove(category);
      });
    }else{
      setState(() {
        repository.tempSelectedCategory.add(category);
      });
    }
  }

}
