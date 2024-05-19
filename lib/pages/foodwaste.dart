import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodWastePage extends StatelessWidget {
  const FoodWastePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                background:
                    Image.asset("images/foodwaste.jpg", fit: BoxFit.cover),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Unveiling Indonesia's Food Waste Crisis: Environmental, Economic, and Social Impacts",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 25, right: 25),
                      child: Text(
                          "Food waste is the discard of edible food, whether it's at the production, processing, retail, or consumption stage. It includes food that spoils before it's eaten, as well as leftovers thrown away after meals. Food waste is a significant global issue with environmental, economic, and social implications, contributing to greenhouse gas emissions, wasting valuable resources, and exacerbating food insecurity.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "Indonesia in a State of Food Waste and Food Loss Emergency. When millions of people still suffer from hunger and malnutrition, a third of all food produced globally is wasted and lost every year. All this wasted food is sufficient to feed around two billion people, which equals more than twice the number of malnourished people in the world. Food waste is also a serious waste management problem in Indonesia. Indonesia is nominated as the world’s second-largest food waste producer that squanders approximately 300 Kg of food waste per person each year. A recent study from Bappenas, Waste4Change, and WRI Indonesia also reveals that the amount of food waste and food loss in Indonesia from 2000-2019 reaches 23-48 million tons per year.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "Food waste and food loss is categorized as organic waste. Most people often see organic waste not as a huge problem compared to inorganic waste like plastic, because organic waste is biodegradable. In fact, organic waste can pose a more serious threat to our environment, especially if we don’t handle it properly. When the organic waste goes to landfills, and we don’t separate it from inorganic waste, the organic waste will decompose anaerobically (without oxygen). As a result, it will release methane into the atmosphere, one of the greenhouse gas emissions which contributes to global warming and climate change. Methane is 25 times more powerful than carbon dioxide in terms of trapping heat in the atmosphere. The emission that is generated from food waste and food loss is equivalent to 7.29% of the average emission of Indonesia per year. Asides from environmental impact, food waste and food loss also affects our economy. The amount of food waste and food loss generated from 2000-2019 has caused economic loss of about 214-551 billion per year. This economic loss is comparable to 4-5% of Indonesia’s GDP. Moreover, this economic loss could have been bigger if we calculated the numbers according to the real time food price.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 15, right: 25),
                      child: Text("How to Stop Food Waste and Food Loss",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 28, right: 25),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            "All parties including producers, government, and consumers should take action on preventing food waste and food loss. To reduce food wastage in the supply chain (food loss), producers should create a production plan based on consumers’ demand, provide sufficient food storage/cooling system, and process the fresh produce into a ready to eat food which can last longer.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 28, right: 25),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            "Unstable prices often make farmers not willing to sell their products to consumers, which causes food loss. Hence, the government should be able to guarantee price stability. Government should also streamline the supply chain to minimize food loss. As consumers, we can also prevent food waste by doing meal preparation to measure our needs accurately. (greenation foundation, Siti Aisyah Novitri, 5 November 2021).",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
