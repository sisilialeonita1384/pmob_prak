import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FloodPage extends StatelessWidget {
  const FloodPage({Key? key});

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
                    Image.asset("images/flood.jpg", fit: BoxFit.cover),
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
                        "Battling the Deluge: Amplifying Awareness of Flood Devastation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 25, right: 25),
                      child: Text(
                          "A flood is an overflow of water onto land that is usually dry. It can be caused by heavy rainfall, melting snow, ice jams in rivers, or the overflow of bodies of water, such as rivers, lakes, or oceans. Floods can result in damage to property, loss of crops, disruption of transportation, and even loss of life. They are a natural disaster that can have devastating effects on communities and their infrastructure.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "The death toll from severe flooding in and around the Indonesian capital of Jakarta has risen to 66 as parts of the country continue to reel from heavy rain that began on New Year’s Eve. Landslides and flash floods have displaced more than 36,000 in Jakarta and the nearby provinces of West Java and Banten, according to the ASEAN Coordinating Centre for Humanitarian Assistance (AHA).",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "These are the worst floods Indonesia has seen since 2013, when at least 29 people died in the aftermath of torrential rains. The disaster, experts say, underscores the impacts of climate change in a country with a capital city that is sinking so quickly that officials are working to move it to another island. The floods are also threatening to exacerbate the already severe wealth inequality that plagues the Southeast Asian nation.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 5),
                      child: Text(
                          "How does climate change fit into the conversation?",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "Experts say the devastating floods are a reminder that the world’s fourth-most populous country is highly vulnerable to climate change, which many blame for the severe downpours and extreme dryness that comes after a bout of heavy rain.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 28, right: 25),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            "Certain areas of North Jakarta are sinking by 6 to 10 inches a year, according to the World Bank, and could fall up to 16 feet below sea level by 2025. Excessive extraction of groundwater for daily use is responsible for the fate of the city, which is home to 9.6 million. Indonesia announced last August that it would move its capital to the island of Borneo as overcrowding and pollution in Jakarta worsens. (BBC, 5 APRIL 2021).",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 15, right: 25),
                      child: Text("5 inventions and ideas to stop flooding and mitigate its effects",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "• The rapid response water-gate",
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
                          " When flooding is imminent, you often need a barrier to protect yourself. Sandbags serve this task in many scenarios, but they may require a significant amount of preparation and set-up time, plus it’s cumbersome to carry around. A device known as the Water-Gate can be a useful alternative. This is a rapidly deployable device made of PVC material. It utilizes the pressure of oncoming water to stabilize itself. This essentially means that the floodwaters are used to build their dam.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "• Carrying out Flood Cleaning with Ditches",
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
                          " If it rains, the rainwater cannot flow to other places so flooding occurs. Therefore, it is important to ensure that there are no blockages in the drain pipe.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "• Prevent flooding by throwing rubbish in the right place",
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
                          " Any rubbish that we throw away carelessly has the potential to clog waterways. Even though we throw rubbish not near a ditch, the rubbish can be carried by the wind and end up falling into waterways.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "• Having a garden at home can prevent flooding",
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
                          " Making a small garden at home can prevent flooding. The lack of green land, especially in urban areas, makes flooding worse. Trees have roots whose function is to absorb air. If there are no trees, rainwater cannot be absorbed into the ground, causing flooding.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "• Insert the Biopore Hole",
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
                          " With bio pore holes, rainwater will be more easily absorbed into the soil. This causes an increase in groundwater reserves and reduces the risk of flooding. Apart from that, you can also throw organic waste into this hole. This hole also functions to convert organic waste into compost so as to reduce waste that ends up in the final landfill. ( Sharon, 6 oktober 2022).",
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
