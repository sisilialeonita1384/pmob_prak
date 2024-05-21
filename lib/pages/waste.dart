import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WastePage extends StatelessWidget {
  const WastePage({Key? key});

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
                    Image.asset("assets/images/waste.png", fit: BoxFit.cover),
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
                        "Catalyzing Action on Inorganic Waste: Imperatives for Environmental Sustainability",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 25, right: 25),
                      child: Text(
                          "This February, we will welcome National Waste Care Day soon (Indonesia: Hari Peduli Sampah Nasional / HPSN) on February 21st, 2022. Recon to HPSN, we recall our memory about the incident of waste explosion in Leuwigajah Waste Processing Center located in Cimahi, West Java as the background of this memorial day. This incident happened on February 21st, 2005. It caused a waste slide that buried 2 villages. As a consequence, 157 people were found dead. Thus far, the waste problem in Indonesia is still problematic. The amount and type of waste always increases by population and technology growth. However, the promptness of waste management solutions are left behind. Waste production in Indonesia reaches 67,8 million tonnes each year. Inorganic waste is non-biodegradable waste. We produce organic waste easily, such as plastic, glass, metal, and caoutchouc. Organic waste potentially caused land, water, and air pollution. The plastic waste still becomes a hot issue since it drastically increases and environmental damage becomes worse. More than 5 million tonnes of waste plastics are produced in the world. Meanwhile, only 25% of them are recycled. It is a serious threat to human and environmental sustainability.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "We are affected by plastic pollution that destroys land fertility, water contamination, and microplastic in our bodies that come through the fish we consume. Plastics can destroy land fertility since it inhibits water and sunlight absorption processes. It inhibits the growth of fertilizer microorganisms. In the air, plastic production until extermination causes air pollution because the burning process produces greenhouse gases that are harmful to health and thin out the atmosphere. We also cannot avoid water pollution. Plastic pollution harms the river and marine ecosystem, changes the food chain, and reduces biodiversity. (greeneration foundation, Aviaska Wienda Saraswati, 3 February 2022).",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "The cause of current climate change is largely human activity, like burning fossil fuels, like natural gas, oil, and coal. Burning these materials releases what are called greenhouse gases into Earth’s atmosphere. There, these gases trap heat from the sun’s rays inside the atmosphere causing Earth’s average temperature to rise. This rise in the planet's temperature is called global warming. The warming of the planet impacts local and regional climates. Throughout Earth's history, climate has continually changed. When occuring naturally, this is a slow process that has taken place over hundreds and thousands of years. The human influenced climate change that is happening now is occuring at a much faster rate.( National Geographic Society, October 19, 2023)",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 15, right: 25),
                      child: Text("7 Steps and Methods for Managing Inorganic Hard Waste",
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
                            "Appropriate steps are needed in managing waste, so that the waste has economic value and is not harmful to the environment. The following are steps for managing inorganic hard waste that can be implemented to maintain environmental sustainability:",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "• Separate waste into two main categories",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 46, right: 25),
                      child: Text(
                          " Organic (such as food scraps, leaves, grass, and fish bones) and inorganic (including rubber, glass, plastic, cans, and paper).",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "• Provide two separate trash bins for each type of waste",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 46, right: 25),
                      child: Text(
                          " Changing our main energy sources to clean and renewable energy is the best way to stop using fossil fuels. These include technologies like solar, wind, wave, tidal and geothermal power.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "• Switch to sustainable transport",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 48, right: 25),
                      child: Text(
                          " Some inorganic waste can be recycled, including paper, cardboard, glass bottles, plastic bottles and cans. Apart from being used as crafts, this waste can be taken to a recycling center or handed over to scavengers.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "• Separate inorganic hard waste and send it to recycling centers that have the knowledge to process it without harming the environment.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "•	Meanwhile, organic waste can be managed by turning it into compost which is useful for gardening activities.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "• Cultivate the 3R lifestyle (Reduce, Reuse, Recycle)",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 7, right: 25),
                      child: Text(
                          " For example, reuse used plastic bottles as plant pots.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "• Waste management initiatives can also be started by reducing the amount of waste, avoiding the use of single-use products, using cloth bags when shopping, and minimizing the use of tissue.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "•	Lastly, there is a waste bank for inorganic hard waste. After being separated and grouped, the waste can be handed over to a waste bank, and considered as a deposit before being converted into money.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
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
