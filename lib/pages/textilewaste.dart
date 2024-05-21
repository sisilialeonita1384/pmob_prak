import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextileWastePage extends StatelessWidget {
  const TextileWastePage({Key? key});

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
                    Image.asset("assets/images/textilewaste.jpg", fit: BoxFit.cover),
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
                        "Empowering Change: Unveiling Practical Solutions to Combat Climate Change Together",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 25, right: 25),
                      child: Text(
                          "Climate change is the result of human activities like burning fossil fuels, causing global warming and extreme weather. Immediate action is crucial to address its impacts. Climate change is a long-term shift in global or regional climate patterns. Often climate change refers specifically to the rise in global temperatures from the mid-20th century to present. Climate change is the long-term alteration of temperature and typical weather patterns in a place. Climate change could refer to a particular location or the planet as a whole. Climate change may cause weather patterns to be less predictable. These unexpected weather patterns can make it difficult to maintain and grow crops in regions that rely on farming because expected temperature and rainfall levels can no longer be relied on.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "Climate change has also been connected with other damaging weather events such as more frequent and more intense hurricanes, floods, downpours, and winter storms.n polar regions, the warming global temperatures associated with climate change have meant ice sheets and glaciers are melting at an accelerated rate from season to season. This contributes to sea levels rising in different regions of the planet. Together with expanding ocean waters due to rising temperatures, the resulting rise in sea level has begun to damage coastlines as a result of increased flooding and erosion.",
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
                      child: Text("What are the solutions to climate change?",
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
                            "The main ways to stop climate change are to pressure government and business to:",
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
                            "• Keep fossil fuels in the ground",
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
                          " Fossil fuels include coal, oil and gas – and the more that are extracted and burned, the worse climate change will get. All countries need to move their economies away from fossil fuels as soon as possible.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "• Invest in renewable energy",
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
                          " Petrol and diesel vehicles, planes and ships use fossil fuels. Reducing car use, switching to electric vehicles and minimising plane travel will not only help stop climate change, it will reduce air pollution too.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "• Help us keep our homes cosy",
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
                          " Homes shouldn’t be draughty and cold – it’s a waste of money, and miserable in the winter. The government can help households heat our homes in a green way – such as by insulating walls and roofs and switching away from oil or gas boilers to heat pumps.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 35),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "• Restore nature to absorb more carbon",
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
                          " The natural world is very good at cleaning up our emissions, but we need to look after it. Planting trees in the right places or giving land back to nature through ‘rewilding’ schemes is a good place to start. This is because photosynthesising plants draw down carbon dioxide as they grow, locking it away in soils.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 25, right: 25),
                      child: Text(
                          "It’s easy to feel overwhelmed, and to feel that climate change is too big to solve. But we already have the answers, now it’s a question of making them happen. To work, all of these solutions need strong international cooperation between governments and businesses, including the most polluting sectors. (BBC, 6 DESEMBER 2023)",
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
