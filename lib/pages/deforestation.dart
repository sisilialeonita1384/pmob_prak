import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeforestationPage extends StatelessWidget {
  const DeforestationPage({Key? key});

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
                    Image.asset("assets/images/deforestation.jpg", fit: BoxFit.cover),
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
                        "Defending Indonesia's Green Legacy: Unveiling Solutions and Individual Actions Against Deforestation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 25, right: 25),
                      child: Text(
                          "Deforestation in Indonesia, primarily caused by activities like logging and agriculture, poses severe threats to biodiversity and climate. The country, once covered by extensive forests, has seen a significant reduction in forest cover. In 1950, forests constituted 84% of the land area, but by 1999, the figure dropped to 100 million hectares.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "Deforestation in Indonesia, primarily caused by activities like logging and agriculture, poses severe threats to biodiversity and climate. The country, once covered by extensive forests, has seen a significant reduction in forest cover. In 1950, forests constituted 84% of the land area, but by 1999, the figure dropped to 100 million hectares.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "Palm oil plantations, a major contributor, caused 23% of deforestation from 2001 to 2016. Despite national forestry laws, over 3 million hectares of forest were allocated for palm oil production in 2019, often encroaching on conservation and protection forests. Timber, another significant factor, saw 80% of exports in the 2000s coming from illegal logging, resulting in an annual revenue loss of over 4 USD billion. (EARTH. ORG, SAMIHA SHAHREEN, 2 FEB 2022)",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "3 Solutions to Deforestation and What You Can Do:",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 10, right: 25),
                      child: Text(
                          "• Reduce Consumption (A Major Cause of Deforestation)",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 46, right: 25),
                      child: Text(
                          " Overconsumption is one of the biggest causes of deforestation. At our current rate, humans are depleting resources 1.7 times faster than the Earth can regenerate.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 30, right: 25),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            "• Reduce, Reuse and Recycle to Lower the Demand for Logging)",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 46, right: 25),
                      child: Text(
                          " We’ve all heard this one many times, and it’s another key solution to deforestation. Reduce, reuse and recycle whatever you can — especially paper products. After reducing your consumption as much as possible, reuse products until they are depleted or used up. Then, recycle them correctly according to your local guidelines. These everyday habits can make a difference.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "• Use Electronic Devices Responsibly",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 46, right: 25),
                      child: Text(
                          " Taking care of our electronics and repairing them when possible, instead of rushing to get the latest version, decreases the demand for mining minerals. Mineral mining often occurs in priceless regions like the Amazon Rainforest and on Indigenous land against the local community’s will. Steering clear of these unethical, unsustainable practices can also be a solution to deforestation.(utopia, Ashley boyd, 7 november 2022)",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
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
