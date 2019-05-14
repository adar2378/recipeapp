import 'package:flutter/material.dart';

class SingleRecipe extends StatefulWidget {
  @override
  _SingleRecipeState createState() => _SingleRecipeState();
}

class _SingleRecipeState extends State<SingleRecipe>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  int _index = 0;
  List<String> ingridientList = [
    "200g wheat penne",
    "15ml sunflower oil",
    "10ml crushed garlic",
    "1 onion, diced",
    "400g chicken fillet, sliced",
    "1x 250g punnet button mushrooms, sliced",
    "5ml Thyme",
    "15ml wholegrain mustard",
    "60ml cream"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/background.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 1],
                    colors: [Colors.transparent, Colors.black87])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26.0, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 16, right: 16),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Text(
                  "Egg & avocado on toast",
                  style: TextStyle(fontSize: 42, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Card(
                    color: Colors.black38,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "Serves 4",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text("Cook 30 mins",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          Text("Prep 12 mins",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.black38,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    tabs: <Widget>[
                      Tab(
                        text: "Ingridients",
                      ),
                      Tab(
                        text: "Proccess",
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2 + 50,
                  width: MediaQuery.of(context).size.width,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: ingridientList.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            onChanged: (bool) {},
                            value: false,
                            activeColor: Colors.white,
                            title: Text(
                              ingridientList[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                      Stepper(
                        physics: ClampingScrollPhysics(),
                        steps: [
                          Step(
                              title: Text(
                                "Prepare",
                                style: TextStyle(color: Colors.white),
                              ),
                              content: Text(
                                  "Bring a large pot of salted water (1.2 lt water with 7.5 ml salt) to the boil and cook the penne until al dente (cooked but firm to the bite) then drain and set aside.",
                                  style: TextStyle(color: Colors.white)),
                              isActive: _index == 0,
                              state: _index > 0
                                  ? StepState.complete
                                  : StepState.indexed),
                          Step(
                              title: Text("Boil",
                                  style: TextStyle(color: Colors.white)),
                              content: Text(
                                  "Heat oil in a large pot or deep pan and fry the garlic and onion until soft.",
                                  style: TextStyle(color: Colors.white)),
                              isActive: _index == 1,
                              state: _index > 1
                                  ? StepState.complete
                                  : StepState.indexed),
                          Step(
                              title: Text("Fry",
                                  style: TextStyle(color: Colors.white)),
                              content: Text(
                                  "Add the chicken fillet and fry until well browned on all sides",
                                  style: TextStyle(color: Colors.white)),
                              isActive: _index == 2,
                              state: _index > 2
                                  ? StepState.complete
                                  : StepState.indexed),
                          Step(
                              title: Text("Mix",
                                  style: TextStyle(color: Colors.white)),
                              content: Text(
                                  "Add the mushrooms and the thyme and cook for a further 5 minutes.",
                                  style: TextStyle(color: Colors.white)),
                              isActive: _index == 3,
                              state: _index > 3
                                  ? StepState.complete
                                  : StepState.indexed),
                          Step(
                              title: Text("Serve",
                                  style: TextStyle(color: Colors.white)),
                              content: Text(
                                  "Combine the sauce with the cooked penne and transfer to a serving dish and garnish with freshly cracked black pepper and serve immediately.",
                                  style: TextStyle(color: Colors.white)),
                              isActive: _index == 4,
                              state: StepState.disabled),
                          Step(
                              title: Text("Serve",
                                  style: TextStyle(color: Colors.white)),
                              content: Text(
                                  "Combine the sauce with the cooked penne and transfer to a serving dish and garnish with freshly cracked black pepper and serve immediately.",
                                  style: TextStyle(color: Colors.white)),
                              isActive: _index == 5,
                              state: StepState.disabled),
                        ],
                        type: StepperType.vertical,
                        currentStep: _index,
                        onStepTapped: (index) {
                          setState(() {
                            _index = index;
                          });
                        },
                        onStepContinue: () {
                          setState(() {
                            if (_index == 4) {
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                        backgroundColor: Colors.green.shade300,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 80,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Icon(
                                                Icons.done_all,
                                                size: 30,
                                              ),
                                              Text(
                                                  "Contgratulations! Serve hot and fresh :)"),
                                            ],
                                          ),
                                        ));
                                  });
                            } else {
                              _index++;
                            }
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
