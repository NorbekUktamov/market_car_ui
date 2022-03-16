import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final id="home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: Text("Cars",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
        backgroundColor:Colors.transparent ,
        elevation: 0,
        brightness: Brightness.light,
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.notifications_none,color:Colors.black ,)),
          IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart,color:Colors.black ,)),
        ],
      ),
      body:SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              //Categories
              Container(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    singleTab(true,"All"),
                    singleTab(false,"Red"),
                    singleTab(false,"Green"),
                    singleTab(false,"Yellow"),
                    singleTab(false,"Blue"),
                    singleTab(false,"White"),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              //#car items

              MakeItem("assets/images/Tesla-Model-3.jpg","50000","Tesla Model 3"),
              MakeItem("assets/images/tesla.jpg","100000","Tesla Model S"),
              MakeItem("assets/images/porche.jpeg","50000","Porche Taycan"),
              MakeItem("assets/images/audi-e-tron.jpg","70000","Audi E-Tron GT "),
              MakeItem("assets/images/BMW-iX.jpg","80000","BMW iX"),
              MakeItem("assets/images/ford-mustang-mach-e.jpg","50000","Ford Mustang Mach-E"),
            ],
          ),
        ),
      ) ,
    );
  }
  
  Widget singleTab(bool type,String title){
    return AspectRatio(
        aspectRatio: 2.2/1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: type ? Colors.red:Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: type ? 20:16,color: type ? Colors.white: Colors.black),),
        ),
      ),
    );
  }


  Widget MakeItem(String image,String price,String name){
    return Container(
      height: 250,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        ),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 10,
          offset: Offset(0,10),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.2),
          ],
        ),
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(name,style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                            SizedBox(width: 20,),
                            Text("Electric",style: TextStyle(color: Colors.red,fontSize: 18,),),
                          ],
                        ),
                        SizedBox(height: 10,),

                        Text("$price \$",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      ],
                    ),
                ),

              ],
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Center(
                child: Icon(Icons.favorite_border,size: 20,color: Colors.white,),
              ),
            ),

          ]
        ),
      ),
    );
  }
}
