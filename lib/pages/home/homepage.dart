import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectinit/controllers/homeController.dart';
import 'package:projectinit/pages/contact/contact.dart';
import 'package:projectinit/pages/detailPage/DetailPage.dart';
import 'package:projectinit/pages/gatheringpage/gatheringPage.dart';
import 'package:projectinit/pages/home/allgatherings.dart';
import 'package:projectinit/pages/join_gathering/join_gathering.dart';
import 'package:projectinit/pages/join_peer_support_group/joinPeerSupportGroup.dart';
import 'package:projectinit/pages/pulse_record/pulseRecordPage.dart';
import 'package:projectinit/pages/tracker/tracker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var tabs = [
  ["About HSA", 'assets/heart.jpeg'],
  ["Healthy \n Eating", 'assets/diet.jpeg'],
  ["Sleep Well", 'assets/sleep.jpeg'],
  ["Regular \nExercise", 'assets/exercise.jpeg'],
  ["Easy to\n Donate", 'assets/dontae.jpeg'],
  ["Healthy Heart\n Challanges", 'assets/more.jpeg'],
  ["Quit Vices", 'assets/more.jpeg'],
  ["Stress Less\n Smile More", 'assets/more.jpeg']
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final homeController = Get.put(HomeController());
  int activeIndex = 1;
  var homeTabs = [
    HomeWidget(),
    // HomeEditWidget(),
    SafeArea(child: TrackerPage()),
  ];
  var navItems = [
    const BottomNavigationBarItem(label: "", icon: Icon(Icons.menu)),
    // const BottomNavigationBarItem(label: "", icon: Icon(Icons.house)),
    const BottomNavigationBarItem(
        label: "",
        icon: Icon(
          FontAwesomeIcons.heartPulse,
          size: 18,
        )),
    BottomNavigationBarItem(
      label: "",
      icon: Transform.rotate(
        angle: 15,
        child: const Icon(
          FontAwesomeIcons.handshake,
          size: 18,
        ),
      ),
    ),
  ];
  // var drawerItems = [];
  // Widget logoWidget() {
  //   return Container();
  // }

  changeTab(int i) {
    activeIndex = i;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.dialog(AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Are you sure you want to exit?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          exit(0);
                          // SystemNavigator.pop();
                          // Get.back();
                          // Get.offAll(() => LoginPage());
                        },
                        child: Text(
                          "Yes",
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                  ),
                  // const Spacer(),
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "No",
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                  ),
                  // const Spacer(),
                ],
              )
            ],
          ),
        ));
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        bottomNavigationBar: BottomNavigation(
          isHome: true,
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //     type: BottomNavigationBarType.fixed,
        //     onTap: (i) {
        //       if (i == 0) {
        //         scaffoldKey.currentState!.openDrawer();
        //       } else {
        //         changeTab(i);
        //       }
        //     },
        //     currentIndex: activeIndex,
        //     backgroundColor: Colors.red,
        //     showSelectedLabels: false,
        //     showUnselectedLabels: false,
        //     unselectedItemColor: Colors.grey[200],
        //     selectedItemColor: Colors.grey[400],
        //     items: navItems),
        drawer: DrawerPage(),
        body: homeTabs[activeIndex - 1],
      ),
    );
  }
}

class HomeEditWidget extends StatelessWidget {
  HomeEditWidget({
    Key? key,
  }) : super(key: key);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  tileColor: Colors.red,
                  title: Text(
                    "Welcome ${homeController.authService.currentUser!.displayName!.split(" ").first.toString()}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 30, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // const Spacer(),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      // shape: BoxShape.circle,
                      // color: Colors.grey,
                      ),
                  child: Stack(alignment: Alignment.center, children: const [
                    CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/profile.jpg")),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: CircleAvatar(
                          child: Icon(
                            Icons.edit,
                            color: Colors.red,
                          ),
                        ))
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Wrap(
              // itemCount: tabs.length,
              // gridDelegate:
              //     const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: // (BuildContext context, int index) =>
                  List.generate(
            tabs.length,
            (index) => Container(
              padding: const EdgeInsets.all(12),
              // alignment: Alignment.center,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(18),
              //   color: Colors.black.withOpacity(.5),
              //   image: const DecorationImage(
              //       image: NetworkImage(
              //           "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
              //       fit: BoxFit.fill),
              // ),
              height: 200,
              width: 180,
              child: InkWell(
                onTap: () {
                  Get.to(() => const GatheringPage());
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black.withOpacity(.5),
                              image: DecorationImage(
                                  image: AssetImage(tabs[index][1]),
                                  fit: BoxFit.fill),
                            ),
                            // child: ClipRRect(
                            //   borderRadius: BorderRadius.circular(16),
                            //   child: Image.network(
                            //     "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                            //     fit: BoxFit.fill,
                            //     height: 120,
                            //     width: double.infinity,
                            //   ),
                            // ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(FontAwesomeIcons.penToSquare),
                          const SizedBox(
                            width: 20,
                          ),
                          // Container(
                          //   height: 100,
                          //   width: 120,
                          //   alignment: Alignment.center,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(18),
                          //       color: Colors.black.withOpacity(.5)),
                          //   child: Text(
                          //     tabs[index][0],
                          //     textAlign: TextAlign.center,
                          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          //         fontWeight: FontWeight.w400,
                          //         color: Colors
                          //             .white), // style: const TextStyle(color: Colors.white),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: const [
                      //     Icon(Icons.edit),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     Icon(Icons.delete)
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        tabs[index][0],
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
          ))
        ],
      ),
    ));
  }
}

class HomeWidget extends StatelessWidget {
  HomeWidget({
    Key? key,
  }) : super(key: key);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    tileColor: Colors.red,
                    title: Text(
                      "Welcome ${homeController.authService.currentUser!.displayName!.split(" ").first.toString()}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 26, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // const Spacer(),
                  const Center(
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/profile.jpg")),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const WelcomePage(),
            // logoWidget(),
            // const ButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class DrawerPage extends StatelessWidget {
  DrawerPage({
    Key? key,
  }) : super(key: key);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: ListView(
        reverse: true,
        children: [
          const SizedBox(
            height: 70,
          ),
          // const UserAccountsDrawerHeader(
          //     currentAccountPicture: Padding(
          //       padding: EdgeInsets.all(8.0),
          //       child: CircleAvatar(),
          //     ),
          //     accountName: Text("Heart Support"),
          //     accountEmail: Text("abc@gmail.com")),

          ListTile(
            tileColor: Colors.red,
            // leading: const Icon(Icons.info_outline_rounded),
            title: const Icon(Icons.arrow_back, color: Colors.white),
            onTap: () => Get.back(),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            tileColor: Colors.red,
            // leading: const Icon(Icons.info_outline_rounded),
            title: Text("All Gatherings",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white)),
            onTap: () => Get.to(() => AllGatherings()),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            tileColor: Colors.red,
            // leading: const Icon(Icons.info_outline_rounded),
            title: Text(
              "View Gathering",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            onTap: () => Get.to(() => const GatheringPage()),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            tileColor: Colors.red,
            // leading: const Icon(Icons.info_outline_rounded),
            title: Text(
              "Join Gathering",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            onTap: () => Get.to(() => JoinGathering()),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            tileColor: Colors.red,
            // leading: const Icon(Icons.info_outline_rounded),
            title: Text(
              "JoinPeerGathering",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            onTap: () => Get.to(() => JoinPeerSupportGroup()),
            //  showAboutDialog(
            //     context: context,
            //     applicationName: "Heart Health Support",
            //     applicationVersion: "0.1",
            //     children: [const LoremText1()]),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            tileColor: Colors.red,
            // leading: const Icon(Icons.contact_mail),
            title: Text(
              "Contact Us",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            onTap: () => Get.to(() => const ContactPage()),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            tileColor: Colors.red,
            // leading: const Icon(Icons.contact_mail),
            title: Text(
              "Send Feedback",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            onTap: () => showAboutDialog(context: context),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            tileColor: Colors.red,
            // leading: const Icon(FontAwesomeIcons.info),
            title: Text(
              "About App",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            onTap: () => showAboutDialog(
                context: context,
                applicationName: "Heart Support",
                applicationVersion: "0.1",
                children: [const LoremText()]),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            tileColor: Colors.red,
            // leading: const Icon(Icons.logout),
            title: Text(
              "Sign Out",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            onTap: () {
              Get.dialog(AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Are you sure you want to exit?",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () {
                                homeController.signout();
                              },
                              child: Text(
                                "Yes",
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                        ),
                        // const Spacer(),
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "No",
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                        ),
                        // const Spacer(),
                      ],
                    )
                  ],
                ),
              ));
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class LoremText1 extends StatelessWidget {
  const LoremText1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Porro ratione natus quidem ut incidunt ipsam distinctio rem deleniti libero explicabo, sed laborum doloremque veniam dolor perferendis quasi. Quo provident eaque quas? Repellat dolore enim vitae perferendis ipsum explicabo. Aperiam tenetur dolore explicabo sequi vero error minus velit omnis facilis ex ducimus ratione unde dolorum at molestias beatae, odio culpa dignissimos ullam tempora pariatur hic, impedit quidem? Culpa corporis reprehenderit molestiae impedit? Eligendi, dicta? Perferendis totam quae cumque repellendus debitis facilis saepe laudantium, officia possimus exercitationem porro sunt nostrum praesentium sint architecto ullam? Nulla facere non deleniti inventore fugiat vitae earum fugit? Labore, pariatur molestias reiciendis, excepturi eos nam perspiciatis nisi facere maiores expedita ea recusandae quos iure. Repudiandae amet magni fugit molestiae veniam suscipit mollitia blanditiis non commodi deserunt hic, voluptatum corporis praesentium obcaecati odio sit dolorem facilis veritatis similique! Beatae dolore, delectus necessitatibus hic reiciendis nihil, esse provident, ex voluptatum laboriosam ut quae iste corporis illum quaerat enim numquam tempore maiores at! Natus, eligendi assumenda placeat architecto quidem nulla tempore maiores doloremque beatae cupiditate eius aperiam animi quod rerum debitis error dolore! Vitae illo sequi temporibus facere, dignissimos velit inventore sit voluptatum mollitia molestiae, incidunt officiis cumque aperiam quod, tempora maxime delectus fugiat tenetur architecto quo voluptas nihil modi non. Quae ullam magnam animi non voluptatem debitis ut quibusdam quidem sapiente illo. Nobis ea hic velit ipsam cupiditate. Repellendus rerum error itaque doloribus laborum nulla necessitatibus, labore, dicta debitis adipisci at enim. Ipsam ex reiciendis eius id unde, sapiente tempore, repellat earum distinctio quibusdam, dolorum saepe. Voluptates laborum dolores harum facilis consequatur, ipsum distinctio nam numquam earum tempore fugiat exercitationem, eaque sed voluptatem repellat ipsa repellendus, autem maxime id. Natus nobis eos, sit harum veniam tempora voluptatem. Eius sit neque, doloremque fuga repellendus delectus explicabo a corporis. Illo eos nihil in, recusandae temporibus debitis quis omnis vel harum neque laborum repellat vitae nisi et quisquam minus minima repellendus corporis corrupti! Vitae porro at enim? Atque aliquid neque harum maiores, nulla, nihil fugiat quo nostrum voluptatem impedit quisquam magnam repellat praesentium vero expedita ut, esse iure possimus? Nulla dolorem aperiam deserunt nesciunt officiis minima nobis eaque expedita ad sed vel magni eius itaque quisquam temporibus, consectetur nisi quo? Suscipit porro ipsam doloribus sunt! Reiciendis, numquam quo! Excepturi aliquam error totam cupiditate nobis libero sapiente placeat in debitis eius, temporibus amet nemo modi fuga vel distinctio, voluptatibus tenetur laudantium laboriosam quia? Recusandae maxime quaerat iste sunt? Amet debitis asperiores officiis labore consectetur libero aut voluptates nobis veritatis, repellat eveniet rem atque maiores nihil reprehenderit cumque laudantium! Laboriosam voluptatum, odio vitae dolorem nostrum dignissimos rem natus et tempore, eius optio numquam! Qui, repellat laudantium nam alias illum non quisquam pariatur sequi repudiandae quidem, ea rerum labore maiores eaque ratione. Necessitatibus quod rerum nam porro ex dolore doloribus? Eligendi dignissimos laborum aspernatur est consequatur, dolore corrupti facilis. Cupiditate doloribus provident nihil nobis eveniet, deserunt debitis rem. Odit fugit dolor molestias velit corporis dolorum magni quis praesentium iure officia autem facere, libero numquam quidem laudantium accusamus eveniet eum nulla veniam consequatur quaerat quasi. Quas eos, incidunt accusantium reprehenderit dicta expedita? Quibusdam, quis facere recusandae explicabo et, vel natus repudiandae autem mollitia laudantium ea dolorem odio quidem quaerat incidunt id aut voluptas eum atque ab culpa earum ullam? Voluptatum nesciunt ea nulla doloremque ullam blanditiis officia qui beatae alias debitis, dolores ad natus sint accusamus eum quam dolor perspiciatis voluptates dolorem cum unde enim repellat? Iste cumque animi explicabo, natus minima sunt fuga itaque at modi velit tempore quaerat eligendi iusto aliquam suscipit deleniti necessitatibus, laborum eos! Voluptatem modi explicabo officiis placeat quos cumque doloribus alias quia, deserunt minus, vero dolorem accusamus sapiente, ab eum beatae. Ipsum rem laborum debitis repellendus officiis asperiores commodi facere. Voluptatem odit, explicabo molestias eligendi consequuntur corporis fugiat ipsam ut eaque exercitationem inventore voluptate in pariatur, hic cupiditate doloremque numquam, accusantium vel labore molestiae amet. Asperiores veniam quo placeat culpa molestias fugiat totam, hic accusamus natus consectetur sint atque delectus? Dolorem ipsa excepturi inventore! Cupiditate, aspernatur! Aliquam illum ea ab, provident odit harum aspernatur saepe officiis repudiandae dolor facilis nam voluptatibus alias dolore id maxime praesentium dicta laborum nemo minima ad non impedit totam? Veniam perferendis quaerat itaque excepturi repellat sequi error placeat dolores blanditiis, molestiae quod? Obcaecati, beatae itaque sunt porro et dolorem, reiciendis ad voluptatem officiis quis atque voluptatum nam quasi optio tempore sint minus soluta possimus sequi incidunt iste cum corrupti rerum. Reprehenderit nihil perspiciatis dicta, expedita quae aperiam harum, quis perferendis, beatae numquam at consequatur cupiditate sit? Neque vero odit hic quisquam. Debitis minima necessitatibus nihil voluptatem explicabo cupiditate commodi porro voluptate repudiandae! Error, deleniti iusto et dicta praesentium modi cumque impedit debitis! Esse ducimus doloribus culpa perspiciatis corrupti quae voluptate velit quia molestias laboriosam illum odit quibusdam quos, odio accusantium dolore, facilis fuga deserunt ratione laudantium? At inventore, molestiae deserunt obcaecati doloremque numquam, et iste iusto praesentium dolorem molestias maxime accusamus rem? Dolores nulla, quidem aut, quod facilis corporis impedit recusandae magnam soluta vero iure doloremque quos veniam possimus laudantium natus exercitationem voluptas eveniet maxime perferendis vitae veritatis commodi, voluptatem autem. Reiciendis laborum mollitia tenetur accusamus quae voluptatem hic unde nulla dicta eos, fugiat soluta explicabo deleniti ex autem sit dolores ad, quod veniam magni nostrum enim sed doloremque! Autem veritatis sequi quis perferendis ratione magnam sunt dignissimos repellat mollitia odio beatae dolore, voluptatum, quam natus reprehenderit nulla error quidem aliquam maiores iusto omnis, suscipit cupiditate optio aut! Earum officia soluta obcaecati. Pariatur dolorem dolore cumque esse doloribus, consequatur minus quis eius ex nesciunt corporis earum perferendis odio cupiditate quae ratione! Accusamus soluta laudantium officia possimus est non totam unde delectus dolores sint! Perferendis aliquid ex, inventore reprehenderit quos qui at tempora in est perspiciatis placeat magni harum nulla eum! Consequatur aliquid dolorem provident velit iusto modi saepe esse vitae similique odio deleniti, vero natus totam error id quidem quo incidunt fugit, nulla repellat? Natus blanditiis repellendus fugit, in quas dolores alias provident ratione vel consequuntur quibusdam, voluptates laudantium! Deleniti illo natus id alias tempora fugit molestiae qui. Optio velit dicta, nam aliquid ipsum molestiae facilis laborum unde, vel fugit illum dolorum enim cum minima in quasi magni totam, quo incidunt expedita adipisci neque illo a. Tempora, amet magnam tenetur excepturi, enim molestias perspiciatis repudiandae ipsa quod eius delectus? Illum facilis fugit, asperiores assumenda nisi animi, perferendis aliquam sequi vero debitis laborum error reiciendis voluptas quas totam culpa nihil tenetur suscipit in neque libero veniam amet maiores quos. Commodi, doloribus voluptate officia ratione tenetur repellendus sunt recusandae fugit voluptatem ducimus sed, voluptas aperiam dolor neque delectus cupiditate saepe at velit. Iure, ab quasi! Dolore assumenda ducimus exercitationem saepe minus nam quod, vero perspiciatis rem id tempore excepturi beatae deserunt, libero maiores magnam iusto suscipit ex harum nesciunt eum nobis ab enim! Ex veniam, quidem officia cumque id aperiam odio alias animi nulla dolore suscipit exercitationem unde obcaecati vel sit molestias quod odit voluptates voluptatibus ut error eos quia. Omnis, eaque corrupti quaerat iste enim odit! Odit similique consequatur natus numquam reiciendis asperiores distinctio ipsa quidem perspiciatis ea aperiam enim blanditiis culpa animi voluptate molestiae sunt autem, voluptatibus laudantium magnam molestias, mollitia temporibus? Doloribus, amet. Expedita enim excepturi nihil quibusdam molestiae quis. Odio praesentium ex atque itaque consectetur ipsum laborum illum saepe voluptate libero. Velit, facilis repudiandae. In quam blanditiis, culpa laboriosam ea unde voluptatibus tempora explicabo vel provident distinctio aut minima ipsum asperiores illum temporibus magni impedit possimus. Eum, nemo delectus assumenda deserunt in cumque libero temporibus amet aperiam sequi, nisi esse reprehenderit a minima nobis obcaecati dicta illum similique? Minus culpa placeat quam repellendus provident fugiat aliquam atque quisquam minima sed repudiandae sapiente qui autem, nam modi hic. Deserunt aperiam, quia tempore officiis voluptas dolores blanditiis numquam esse doloremque consequuntur iure. Dolorem recusandae, earum ducimus laboriosam perspiciatis molestiae, nesciunt repellat esse numquam facilis ad natus sint porro, enim qui sunt amet corporis. Minima, asperiores fugit! Assumenda voluptate, reprehenderit facere vel voluptatem unde. Obcaecati, cum. Itaque atque assumenda molestias nobis exercitationem quas quae. Natus praesentium reprehenderit repellat at. Animi rerum cupiditate placeat nulla excepturi quam. Consequatur numquam, sed asperiores dolorem commodi eius soluta error porro deserunt veritatis ab tempora deleniti voluptatem impedit voluptas tenetur corporis totam labore iste blanditiis similique pariatur at dolore. Vitae architecto soluta asperiores. Molestias beatae et facilis id quas enim architecto culpa aperiam. Voluptate, obcaecati? Consectetur aliquid consequuntur veritatis, ipsum corporis dolores nulla nobis hic asperiores, facere ex accusamus iure. Rem ipsa in eaque ad cupiditate ea incidunt debitis asperiores eligendi minus provident natus voluptatum consequuntur commodi aliquid molestias reprehenderit dolor delectus possimus repellat, sed quo odit! Tenetur fugiat neque laudantium impedit distinctio iure, consequuntur corporis nemo odio ea maiores sequi, quia excepturi rem magnam id a nostrum ullam accusantium. Minima, cumque? Maxime labore, cum dolores omnis voluptatum totam placeat illo eius quis necessitatibus est corrupti, laborum vero quasi obcaecati reprehenderit rerum voluptatem dolor optio voluptas officia nihil. Aspernatur aut, harum perspiciatis consequuntur non qui placeat eum praesentium velit officia iure voluptate accusamus, illo excepturi veniam. Debitis cumque possimus autem dicta voluptatem, officia earum at beatae soluta? Maxime, porro dolores ut iure facere explicabo itaque. Et maiores natus veniam quae impedit, ut earum placeat dolore sequi officiis in quia ea iste accusantium modi dolorum cumque dolorem delectus harum amet voluptates enim! Perferendis, consequatur! Ex iusto laudantium eius nemo cupiditate nesciunt, rerum veniam optio architecto explicabo! Laudantium quas perspiciatis cupiditate maiores. Aperiam ratione neque quidem? Optio, est porro eos at quia autem dolor dicta dolorum quasi tenetur officiis iusto quaerat eius officia nobis id in aliquid. Aliquam, odit. Esse nulla eaque iure dicta ab odio repellat, rem ad fugiat hic neque rerum dolorum incidunt beatae maiores unde eum. Eveniet nulla placeat earum repellendus accusantium expedita esse nam dolore voluptates sint? Facilis, provident. Quos earum necessitatibus sed veniam. Quod distinctio facilis ipsum fuga minima. Consequuntur fugiat maxime porro ab deserunt voluptatibus molestias ipsam at dolore mollitia dolorem quo tempore odit dolores officiis nulla, culpa in, facere quod ea sit vitae rerum consequatur. Nisi tenetur ut officia ipsa odio modi reiciendis eos optio, nemo aliquid molestiae animi ea voluptatibus deleniti rem voluptatum eum soluta dignissimos incidunt perspiciatis veniam rerum consequatur quo! Aut doloribus debitis explicabo maxime cumque fugit tempore blanditiis, natus ab perferendis, dolorem delectus corrupti consectetur voluptas vel possimus fuga provident rem? Nulla excepturi molestiae tempora qui molestias voluptatibus aliquid saepe ducimus, minima necessitatibus enim earum. Numquam nobis reprehenderit iure ut at ipsam dolorem, saepe asperiores rem possimus minima repellendus earum culpa nulla nemo aliquam recusandae, impedit ad quam nihil alias. Quos itaque maxime dolores velit a, eligendi asperiores qui obcaecati quis, aspernatur explicabo harum in tempora provident! Ad temporibus illum distinctio quidem dolor veniam, et incidunt odit omnis voluptatibus officia voluptas nihil consequuntur harum id. Nulla iusto dolor enim? Nobis repellendus tempora ratione voluptatum culpa, quibusdam maiores repudiandae deserunt enim nisi incidunt. Fugiat obcaecati nihil rem quisquam culpa! Enim distinctio laborum necessitatibus quas optio, mollitia rem eius cum quidem harum velit repellendus, ad assumenda quaerat hic ipsam quam vero sunt officia itaque repellat a! Sunt mollitia magnam repudiandae! Voluptatem iusto reprehenderit ipsa et! Ratione doloribus alias rem, molestiae praesentium deserunt animi fugiat voluptas id nam cum vel illum quam, ipsam fugit beatae delectus ipsa magni amet culpa nihil quas unde. Nam, error labore? Eius, vel quas odio rerum, odit deserunt nostrum consequuntur aperiam sit dignissimos libero quis ut laboriosam veniam assumenda reiciendis laudantium deleniti voluptatum itaque. Blanditiis sint eius temporibus iste soluta minus est enim dolorem? Quod, eos? Neque temporibus saepe maxime dolore similique. Unde esse voluptates quo accusantium sunt quis, repellat saepe numquam eius facere delectus aliquid optio? Alias rem consequuntur nam expedita nemo nesciunt ea eaque quasi suscipit vitae aperiam minima aut doloribus cupiditate esse dignissimos qui ullam, aspernatur debitis tempora sint blanditiis, dolorem perferendis. Harum enim incidunt impedit omnis vitae sed qui ipsa, modi facilis, iusto, eius ullam. Accusantium eos dolorum sequi, eligendi iusto maxime unde quam rerum cumque earum tempore minima recusandae ab pariatur tenetur quidem molestiae sapiente, placeat consectetur voluptate quo laudantium suscipit! Laudantium nihil quisquam ratione consequatur perspiciatis? Magnam quos dolorum, excepturi odio sapiente assumenda non. Ea blanditiis qui ipsam architecto libero. Blanditiis quos pariatur, est, tenetur rerum excepturi amet, consectetur perspiciatis aspernatur culpa porro fugit? Quos doloremque accusantium aliquid voluptatem, vitae vero. Ratione animi tenetur consequatur, itaque, amet, id est maxime dignissimos facere quis recusandae? Fugiat mollitia est iure sit eaque incidunt nobis velit optio corporis iste autem odio quae minus labore veritatis quos vitae quibusdam alias quas, esse voluptatum itaque ipsam. Cupiditate, officia omnis quis eum labore dolore dolorem officiis. Velit voluptas quidem autem assumenda, reprehenderit iure, nostrum cupiditate cum placeat temporibus et ratione repellendus error, tenetur eum facere ea possimus voluptates molestias quaerat ipsum tempora exercitationem magnam! Ducimus necessitatibus sed atque nulla nemo assumenda veniam vitae architecto sint libero! Soluta, quisquam ducimus magnam suscipit ut quaerat tenetur, doloribus quidem quia impedit, ipsam et laborum? Qui suscipit iusto est voluptate dolorum ipsum, doloribus veritatis, porro nisi atque voluptatibus alias dicta numquam accusamus distinctio cupiditate quaerat. Velit cupiditate in placeat modi earum ad dolorum officia repellendus. Aperiam ea temporibus vitae autem inventore quaerat alias aspernatur eos explicabo voluptas facilis magni, exercitationem suscipit eaque, deleniti expedita nesciunt est a. Magnam eos in, dolorem perspiciatis minima cupiditate beatae exercitationem at consequatur magni odio ex dolore rerum omnis quo est ea laboriosam sunt animi quisquam provident veritatis nisi id. Consectetur repudiandae nesciunt vero, doloribus incidunt non ullam nam sed eveniet officia ipsa, laboriosam perspiciatis ratione ea doloremque, voluptate iure laborum expedita? Quos excepturi eos ipsum, beatae temporibus ea repudiandae nam, vitae rerum architecto minus dolorem iste neque laborum a magni repellat consequatur incidunt ipsa quo quam quasi sint. Molestias veritatis porro itaque sapiente ipsum ducimus. Hic reiciendis, explicabo tenetur commodi pariatur vel culpa quidem dicta dignissimos dolores rerum autem doloremque quis maxime, odio quia molestiae. Accusamus, minima ipsum omnis, quos facere quas alias perspiciatis illo voluptatum quae veniam fuga quisquam! Magnam architecto quidem fuga minima, praesentium nihil saepe totam inventore vel in blanditiis hic voluptatibus provident repellat, nisi laudantium expedita libero dolore. Tempora officiis sit cum quasi a mollitia? Adipisci perspiciatis dignissimos sit nam repudiandae molestias laboriosam harum dolores vero consequatur unde, exercitationem illum officia eum, veniam quia quae consequuntur perferendis atque sapiente voluptate reiciendis natus tempore possimus! Eaque nesciunt, iure odio minus quis repellat quisquam. Earum excepturi dolores asperiores molestias, perspiciatis corporis. Illo temporibus consequuntur laborum molestias animi velit eligendi id optio inventore dolore quos labore accusantium, eveniet alias! Officia tenetur doloremque, vitae nulla iusto consequuntur pariatur iure saepe ipsum odio voluptatem ex voluptates beatae ab tempora! Expedita quis eaque accusamus laboriosam repellat deserunt aperiam! Eligendi vitae et animi reprehenderit porro, non odit? Dolores officia enim ad expedita iure voluptas eligendi unde earum non ipsum rerum eum, impedit ex, cumque minima, iusto voluptatem. Perspiciatis adipisci quo atque ab laudantium, eum aspernatur perferendis! Qui numquam, asperiores eaque blanditiis corporis, reiciendis quia consequatur nesciunt similique cum quibusdam laborum, repellat officiis odit nisi neque sint nemo dolore incidunt ea quae culpa assumenda? A omnis nulla quia ratione vitae nostrum deleniti accusantium saepe velit, doloribus nam praesentium vero labore explicabo laudantium. Delectus exercitationem eveniet voluptatibus a laudantium eos eligendi dolorem est aliquid non? Nobis libero temporibus adipisci? Suscipit iure exercitationem perferendis voluptas, alias cum sed esse voluptatum magni eveniet facilis asperiores id itaque ullam corrupti fuga recusandae blanditiis tempore illum vel minima aliquid cupiditate. Quod nesciunt, quae iste commodi est ut expedita ex modi! Nemo dolore sed veritatis fuga libero quas repellendus aut praesentium. Cumque nisi neque doloremque nobis doloribus. Reprehenderit commodi et aliquid, dolores alias fugiat at perferendis tempore, ratione maiores fuga tenetur optio accusamus fugit molestiae quia beatae, expedita ex. Alias, delectus explicabo libero, facilis adipisci aut esse accusantium nulla debitis eveniet odio expedita. Dolores dolorem, accusamus quo commodi earum maiores, corporis dolor alias enim esse totam unde laboriosam atque sint deleniti fugit dolore necessitatibus! Labore cumque corporis quae sunt saepe assumenda et natus, rerum modi quis iste sit excepturi esse libero tenetur, fugit omnis tempore? Quis ex rem sequi exercitationem error placeat, aperiam animi sed iste pariatur, aliquid ratione soluta ab minima mollitia? Quo saepe tempora, corrupti molestias delectus dolor quidem autem, eum quos voluptates ipsum impedit! Minus eaque, ut inventore nihil dolore autem porro ipsam facilis repellendus voluptates sed fugiat delectus saepe aperiam debitis? Sint optio distinctio unde accusamus! Quibusdam nulla delectus voluptatibus autem est unde laboriosam minus libero laborum, saepe a deserunt nesciunt totam consectetur cumque impedit odio blanditiis recusandae facilis tempore obcaecati minima necessitatibus nihil id. Est quas adipisci cupiditate fuga error ab unde reprehenderit maxime, delectus perspiciatis, vero dolor itaque aut? Ut, quod atque. Obcaecati qui sapiente quam itaque quia quibusdam similique commodi quasi molestias architecto ipsam odit nemo, dolorem nostrum, accusantium iure esse modi hic harum id! Dolore debitis, dolores qui aperiam, nobis alias nulla quidem iure ab suscipit labore vitae deleniti fugit dolor. Deleniti, porro, molestias voluptates praesentium tempore animi velit, repudiandae suscipit error aspernatur mollitia nemo! Voluptas at repudiandae nobis laudantium quo consequuntur iusto eum sint eos obcaecati? Saepe eius reprehenderit provident deleniti laboriosam voluptates quo vitae explicabo vel, tempora quae itaque? Alias consequuntur consectetur soluta debitis, mollitia, placeat similique at quos cupiditate corrupti doloribus quo aliquid numquam praesentium eveniet earum excepturi repellendus sunt temporibus nulla? Possimus consectetur saepe neque sunt sint non aperiam debitis perspiciatis ab vitae repellat, doloribus tempore explicabo fugiat. Quidem excepturi perspiciatis itaque voluptates necessitatibus quam! Beatae quis modi quaerat accusamus voluptas, quae exercitationem laborum quas vitae, tenetur odio natus enim, vel rem excepturi nemo et earum alias eos rerum sequi ea voluptates voluptatum? Expedita ab nisi, perferendis, eligendi, quis possimus enim sint repellat aperiam neque ipsa hic laudantium! Quaerat eum ducimus, nemo suscipit numquam reiciendis, aliquam excepturi architecto minus cupiditate repellat. Obcaecati provident velit doloremque iste hic, tenetur nisi, at dignissimos tempore similique ratione neque? Voluptatem quisquam harum magni totam sunt vero, debitis repudiandae nihil exercitationem esse asperiores aliquid ratione omnis laudantium distinctio voluptas sapiente! Fugit similique ipsum deleniti, placeat quas dolor illo assumenda. Fuga, hic unde! Ullam dolorem, ducimus, sunt exercitationem ut earum ex, beatae voluptatum recusandae reiciendis accusamus explicabo natus aliquid animi deserunt pariatur velit aut commodi consequatur voluptas itaque! Iste necessitatibus delectus autem provident, fugiat maiores quam. At, ducimus reprehenderit! Iusto et quia in, dolorem mollitia praesentium tempore, facilis vel quos tempora enim reiciendis, eos omnis repellendus. Sapiente cupiditate corrupti, a ad quo non placeat nemo neque. Reprehenderit magni odit suscipit ipsam ullam iusto nam consequatur odio incidunt, blanditiis vero, repudiandae officia quidem harum eligendi sed debitis provident corrupti impedit inventore. Ab a velit dolore similique aliquam aliquid suscipit voluptatem, rerum, dolor, amet necessitatibus sed in tempore quam saepe? Ex natus dolore doloribus ratione voluptates, ducimus explicabo. Distinctio praesentium nobis magnam illum numquam repudiandae voluptate, corrupti excepturi facere sequi modi beatae et dolor enim eum quo itaque. Numquam repellat, laborum facilis distinctio eligendi facere. Nisi minima dolorum sed est similique eius pariatur exercitationem, voluptates tempora, ratione dolorem inventore libero ipsa. Cum harum quos amet quisquam doloremque accusantium, labore exercitationem expedita tempore facere ipsam dolorum aut, necessitatibus praesentium quasi. Doloribus a libero est, unde enim et officia tempore, rerum cupiditate architecto velit sapiente labore iure veniam sequi, ullam harum aspernatur reprehenderit eos. Saepe dolorem modi perspiciatis blanditiis deserunt. Sit at vel error ipsum cumque nostrum dolore fugit! Aperiam nisi praesentium dolor rerum similique suscipit vitae commodi, ipsam dolores id cupiditate aspernatur error quidem, earum recusandae deserunt atque nihil. Minima voluptatibus laborum autem deserunt, excepturi vero dolores recusandae, odit saepe, tempore culpa assumenda quas sunt molestias ad eaque reiciendis cupiditate harum at possimus velit eos? Quos consequuntur deserunt expedita dolore necessitatibus hic fugit, similique nemo rerum esse nulla et nihil beatae iure? Minus, quidem. Fugiat omnis vitae odit quisquam enim voluptatem modi veritatis eius non, delectus voluptates aspernatur, inventore accusantium nobis, dignissimos ullam eum maiores harum? Quod tempora quis sequi, animi asperiores maxime autem, repellendus quo libero magnam beatae voluptas sapiente voluptate. Tempore ad nostrum repellat laudantium, enim nemo in debitis exercitationem pariatur voluptatibus perferendis eligendi voluptas voluptatum repellendus, dolorem recusandae corporis non sed blanditiis! Repellat natus voluptatum ipsum, minus blanditiis nam maxime eum consequatur, laboriosam odio expedita quidem et saepe quas cum vitae molestias repellendus tempore quo officiis excepturi libero quae ducimus. Praesentium dignissimos maxime perferendis accusantium consequatur, ipsum in, voluptatibus natus inventore quod nemo. Reprehenderit molestias in qui. Delectus accusantium adipisci molestias placeat magnam dolorem ducimus nisi? Dolor inventore at officiis placeat dignissimos delectus cumque, nobis consequuntur, unde saepe alias cum aperiam veritatis possimus iste excepturi eum? Quaerat iste, tempora praesentium consectetur explicabo pariatur nam excepturi delectus cupiditate eum nobis minima. Alias iure modi, architecto provident cupiditate libero dignissimos, excepturi accusantium sunt harum ratione, quae dolores asperiores eum vitae? Similique consequatur ratione officia numquam soluta quo sint facere earum architecto nulla molestiae, iusto ut illo sapiente, commodi voluptatum placeat porro. Error unde adipisci, provident optio suscipit, amet nam culpa, placeat dolore laboriosam nisi fuga sed temporibus architecto dolorum voluptas voluptates iste id fugit reprehenderit quam accusantium. Quidem et dignissimos ex culpa quas totam, illum architecto rerum officiis! Animi eaque molestias aut voluptatibus eligendi, perspiciatis deserunt enim accusamus sint, voluptatem quod! Nesciunt ratione qui quam dignissimos! Voluptatum quisquam, dolores quas eos, velit fugit ut, ad consequatur eveniet delectus eum deleniti quos sit culpa rem voluptas vel eaque saepe sint quam libero repellat. Nesciunt, necessitatibus. Eligendi vel voluptatibus voluptate, consequuntur consequatur excepturi? Aut iusto veniam mollitia, consequatur numquam ratione a reprehenderit officia, soluta eveniet accusantium eos assumenda minus neque esse excepturi quisquam officiis architecto voluptatum. Perferendis veritatis quae officiis esse numquam dolorem harum quaerat, enim libero ullam, cum magnam facere nisi quidem natus et rem minima nostrum minus eaque molestiae eveniet corporis eius? Architecto sequi totam animi aliquam eum deleniti est saepe asperiores illum modi. Molestias, tempore voluptate incidunt exercitationem vitae ad fuga odio inventore blanditiis eius aperiam? Earum, libero, quaerat aliquid itaque perspiciatis corrupti mollitia explicabo odit aut tempore quibusdam totam animi laudantium vel facere modi adipisci ex! Fugit, commodi. Non praesentium itaque accusamus, vitae iste magnam at quidem numquam ipsum ut laudantium provident corrupti quae iusto suscipit consequatur iure facilis maiores atque ducimus consequuntur? Eligendi voluptate, recusandae explicabo nihil illum molestias magnam quaerat sint odit animi sed mollitia quia, a laudantium neque corporis quas alias, deleniti asperiores nesciunt repellat. Repudiandae asperiores numquam tempore ab? Perferendis repellat recusandae consequuntur eius laboriosam sapiente eveniet. Placeat sint architecto animi iusto atque numquam itaque! Animi fuga inventore ducimus, natus error soluta odit tempore quas illo labore ex sed nam adipisci, ea est tempora officiis ullam totam possimus eius. Rem ipsa repudiandae atque saepe commodi sit molestiae, aliquam cum beatae. Voluptate, ab? Dolorum et modi perspiciatis amet nam cum dolores ipsa, nostrum at nisi iure eligendi accusamus repellendus debitis quod doloremque id quis optio magnam officia? Debitis impedit iste veniam dolores accusamus eveniet, reiciendis culpa, quas, labore ex asperiores optio? Voluptatem perspiciatis repudiandae enim impedit vero pariatur quidem eligendi cumque veritatis eaque nemo perferendis odio sint unde sunt tempora molestias repellendus illo, vel consequatur sequi ex cum odit. Explicabo beatae quibusdam excepturi recusandae! Impedit deleniti dolore veniam odit itaque reiciendis laboriosam aliquid eius, incidunt, perferendis quas delectus suscipit ab non necessitatibus! Deleniti accusantium cupiditate laborum nulla, ab beatae itaque ad a maiores voluptas adipisci, hic dolorem officia. Id veniam dolorum quidem quis tempora, dolore, dicta magni deserunt eius, explicabo provident. Numquam, maiores aspernatur nulla totam rerum eaque laborum ipsam aliquam iusto facere ea corrupti a sapiente ab libero. Excepturi aliquid totam molestias cumque voluptate aspernatur ut, molestiae ad, vitae eaque blanditiis facilis soluta dolorum possimus aperiam numquam facere dolores deleniti odit ratione temporibus nesciunt, eos enim! Obcaecati cupiditate dolor saepe incidunt dolore repellat temporibus error dicta architecto quo neque, doloribus provident officia. Est eum unde quam quo quas hic sit maiores itaque labore voluptatem voluptatum placeat commodi, reprehenderit omnis saepe ea dolorum a dolore necessitatibus, molestiae, in quis cupiditate! Ab quasi, quisquam aperiam magni deleniti blanditiis maxime accusantium suscipit mollitia ex animi recusandae unde voluptates maiores libero ea corrupti qui cum tempora reprehenderit fugit commodi sequi! Nisi, id. Omnis atque sapiente, qui praesentium necessitatibus soluta molestias doloremque ad esse illum voluptatibus. Eos, laudantium vitae exercitationem illo minima minus sapiente sint atque ullam consequuntur quasi cum ducimus dicta voluptatem iure? Illo, optio facere odio similique id saepe omnis quibusdam deleniti pariatur a at explicabo adipisci dolores aut sed quam. Sit beatae modi incidunt quos nisi similique soluta animi! Explicabo iste ducimus tempore commodi architecto reiciendis doloremque odit modi debitis ipsa hic, tenetur eos aliquam rerum aut, in adipisci quam quisquam alias et voluptas aperiam, cumque beatae. Commodi iure inventore corporis autem iste exercitationem error vero. Ipsam cumque esse perspiciatis quod, non placeat. Cum quod esse culpa velit beatae ullam perferendis dolorem eveniet, odit recusandae soluta incidunt debitis delectus placeat nobis saepe alias quos enim cupiditate illum earum est? Officiis aut nostrum accusamus suscipit provident saepe tempora in, sit, delectus ratione earum quidem culpa sunt unde doloribus id error iusto cumque voluptas assumenda excepturi amet sequi sed. Placeat sunt explicabo consequuntur eligendi vero id ducimus aut blanditiis, aperiam quos earum facere voluptate autem. Repellat recusandae minima dicta blanditiis tenetur animi dolorem quasi beatae quia sequi nesciunt qui expedita dolorum quaerat molestiae earum, sunt vel. Architecto aliquam libero amet hic rerum blanditiis voluptatibus laborum. Tempora, voluptatibus optio. Soluta labore harum cupiditate, repellendus molestiae eius libero nulla officia ipsam nesciunt rem, magni minus consequuntur voluptatibus quisquam assumenda earum velit eaque autem! Aliquid, tempora debitis ab consectetur possimus explicabo ipsa mollitia suscipit magni similique quidem placeat ut commodi voluptatum repudiandae doloremque natus, iusto delectus quaerat deleniti necessitatibus! Necessitatibus nihil qui ab illo ipsa? Quisquam modi laborum facere repellendus quasi sapiente, placeat esse dicta quae illo quibusdam voluptate et magni. Est qui exercitationem omnis quidem expedita nemo, placeat perspiciatis quam quis blanditiis rerum nam molestias cum magnam vero enim obcaecati sapiente sunt rem et. Quo optio reprehenderit voluptatum vitae cumque officiis fugit doloribus! Quos magnam expedita libero accusamus dolore adipisci officia facilis quo a cum! At accusamus reiciendis, pariatur dignissimos deserunt perspiciatis esse odit, sit non maiores, animi labore? Aut odit voluptatem inventore nisi beatae accusantium laborum dolorem, nesciunt, asperiores sint consectetur animi esse ratione fugit, corporis suscipit amet repudiandae cum dolor. Laboriosam quibusdam fuga cumque aliquam consequuntur voluptates eaque ut, culpa, ab modi itaque eligendi eos tenetur rerum delectus ea. Sunt vero eveniet dolores voluptatibus velit sint distinctio esse praesentium consequatur tenetur excepturi amet nemo ipsam aspernatur architecto libero reiciendis provident magni officiis, natus cupiditate magnam eius? Maiores optio, dolore aut aspernatur esse delectus libero quis ea. Ullam porro aliquam repudiandae itaque totam corporis praesentium sint. Enim neque cumque libero praesentium voluptatum doloribus provident culpa alias ea repellat aliquam, repellendus repudiandae dolores voluptas. Suscipit dignissimos autem adipisci labore quisquam inventore assumenda, accusantium nulla minus dolor tempora similique numquam optio incidunt consequuntur recusandae iure veritatis qui vero ut eius voluptatum cum! Iure facere, ullam sapiente autem aliquam at, eius, iste tempore maiores aut fugit delectus numquam. Vero aspernatur iure vitae nemo laboriosam. Iste minus repellendus magni hic a error, modi similique sed distinctio aliquam necessitatibus ad, cum dignissimos obcaecati, consequuntur inventore totam sequi at libero facilis molestias deleniti? Repellat corrupti voluptatem veniam mollitia quas quasi omnis dolorem dicta aut, quae quibusdam cupiditate facilis eligendi debitis sequi ipsam, nihil, explicabo magni veritatis illum molestiae error aliquam quidem. Itaque, quia quam debitis quis et hic ratione consequuntur porro dolor exercitationem aspernatur eligendi quasi optio ea ab atque amet corrupti esse ullam! Veritatis, quis cumque cum, placeat animi repellat ipsa officiis adipisci libero ad hic voluptatem commodi ut, vel iste ratione eaque aspernatur corrupti optio accusamus molestias quisquam id nobis quam? Odio tempore nesciunt inventore cumque modi rerum soluta cupiditate quidem itaque architecto quisquam harum qui quod magnam quo dolorum ut, saepe laudantium culpa. Numquam ipsum molestias et dolorum adipisci, est labore soluta blanditiis eaque accusantium eum vero temporibus magni! Ut nostrum consequatur totam obcaecati ipsa at odio labore nam! Laboriosam dolorem libero eos! Sint harum ab delectus saepe? Unde enim cumque autem. Sequi vero sapiente rerum alias cupiditate aut enim soluta veritatis atque culpa eius distinctio rem aliquid nihil, minima beatae. Nesciunt, laborum, sed illum corporis enim alias necessitatibus laudantium dignissimos earum consectetur nulla temporibus maiores illo debitis iure porro repellat animi. Nulla, tenetur, praesentium ipsam rerum quisquam inventore magnam quia recusandae in sequi et molestias distinctio deserunt repellat ad asperiores natus dignissimos fugiat laboriosam vero, dolore aliquam corporis optio excepturi? Delectus odit iure ipsam nam eius impedit, unde ex laborum architecto autem molestias. Iusto tempore porro dicta quis ullam maiores, fuga fugit nihil facere officia minima placeat quae vero quasi quia saepe labore repellat nulla blanditiis quidem deserunt ducimus modi voluptates. Reprehenderit sed beatae iste quaerat obcaecati, commodi nihil magni numquam cumque esse accusantium similique praesentium aliquam est unde! Vitae, explicabo. Nihil sequi voluptatem saepe explicabo, dolor quis est! Perferendis similique, impedit atque ipsum illo vero omnis, aliquid non quia beatae, incidunt eius ab quidem esse iure labore! Doloribus exercitationem dolorem deserunt, enim non, atque maiores nostrum nisi repudiandae recusandae incidunt ratione, necessitatibus maxime dolor odio quisquam temporibus cum debitis quaerat ut aut? Voluptate facilis aperiam iure eum inventore saepe ex in consequatur veritatis corporis id aspernatur harum, beatae laboriosam dicta animi vel dolore hic ad nihil illum necessitatibus facere? Fugit ducimus sunt laborum possimus repellat saepe quod dolorem facilis commodi iusto impedit aspernatur a mollitia sequi qui voluptatem enim architecto corrupti, asperiores illo ratione nostrum? Ad nam eveniet quas magni similique voluptatem aspernatur qui commodi cupiditate. Quam eaque iusto tempora necessitatibus ex, illo ipsam repudiandae quidem nostrum expedita in hic maiores doloribus non voluptate cupiditate distinctio fugiat! Sunt maiores corporis officia ducimus! Unde, quia quos dolor reprehenderit iure aspernatur, a ipsam laboriosam maxime hic itaque sequi! Tenetur unde corporis iste id perspiciatis vitae, optio dolores nostrum earum excepturi nulla libero vero velit aperiam fuga eius illo quia ipsa dicta! Non consequuntur, molestiae deserunt eveniet similique doloribus nam perspiciatis, recusandae quaerat autem eius fugiat quam ea aspernatur nobis suscipit, illo necessitatibus est delectus ducimus ut! Quas vitae, soluta quaerat vel dolorem consequuntur! Molestias, in! Quasi esse, adipisci officia fuga eius ab eveniet nobis voluptates voluptatibus maxime accusamus aspernatur earum, laudantium libero dolore. Possimus saepe placeat vel et ut pariatur eius fugiat? Perspiciatis officiis non error voluptates! Cupiditate atque sint quibusdam eveniet eos vel commodi distinctio! Fugiat dolorum officia ipsa impedit laborum veritatis veniam tempore asperiores odio cumque cupiditate, id et possimus, voluptatem error iure saepe delectus in culpa quasi? Rem id excepturi, corporis, fugit omnis ad nulla, rerum a dolorem quibusdam at repellendus modi molestiae facere! Ab voluptate, facilis, maxime obcaecati molestiae iure possimus qui saepe veritatis explicabo tenetur est tempore, repellat doloribus nulla incidunt totam. Nihil dolor libero molestias sapiente ab animi officiis doloremque voluptatibus odio atque natus totam fugiat ipsa iusto obcaecati beatae dolorum, vero, rerum provident odit pariatur possimus est! Fugit impedit dolorem accusamus dolore, ullam soluta blanditiis laborum eum facere molestias dignissimos vitae, tempore nemo reprehenderit quasi ex optio animi neque autem minima. Cupiditate quia impedit quam error iste placeat minima sit animi ipsum similique in reprehenderit nesciunt quasi earum commodi optio veritatis officia exercitationem esse, eveniet eos! Distinctio, iusto eum. Libero molestiae nisi sequi itaque ea expedita aliquid, omnis cum quisquam voluptatem error fugit, dolorum, molestias blanditiis. Assumenda ad necessitatibus voluptatem ut ipsam culpa dolores vel, voluptate, repellat ipsa quo itaque perspiciatis? Aliquid eum dolorum, beatae quisquam nam eligendi asperiores magni ipsam exercitationem aperiam vero quidem enim officiis saepe amet autem repudiandae deserunt perferendis facilis libero necessitatibus excepturi facere? Deleniti ducimus dicta hic? Ad, exercitationem. Tempora non labore nihil obcaecati quis error maxime repellat fuga dolor quos ducimus, deserunt exercitationem quasi, numquam excepturi amet unde consequuntur delectus cupiditate voluptas pariatur? Obcaecati harum minima minus, voluptate cumque nam atque, exercitationem a aliquid blanditiis sequi quidem quaerat doloribus molestiae? Eius dignissimos quam unde blanditiis officia aut, perferendis, molestiae excepturi consectetur corporis numquam culpa doloribus maiores ex exercitationem id voluptates cupiditate? Doloribus illum atque saepe temporibus cupiditate commodi. Sit blanditiis obcaecati illo saepe et dolorem placeat, eveniet autem nostrum corrupti facere rerum aliquid iusto. Tempora laborum vero neque quae quasi, exercitationem molestias voluptas sunt culpa voluptatem, qui pariatur eaque, necessitatibus facere! Itaque iste ab ipsam perferendis. Saepe voluptatem amet debitis temporibus quasi consequuntur incidunt, vitae dolorum doloremque quos nisi. Tempora libero ducimus dolores numquam praesentium commodi debitis dolore nemo et veritatis beatae assumenda deleniti aliquid, ab delectus distinctio, reiciendis cupiditate similique sequi? Rem itaque commodi nulla ducimus doloremque accusantium reiciendis dicta maiores, quas in odio dolorem, fugit impedit, blanditiis explicabo illo quisquam vero vitae. Ex eaque eius rerum reiciendis sequi, ab veniam? Adipisci natus, molestiae nesciunt quos at ipsum sequi perspiciatis ullam rerum qui nisi error aliquid. Ab excepturi dolorem molestiae, voluptas explicabo aperiam, voluptates quia totam minus perferendis et quae. Fugiat aspernatur quasi quibusdam corporis voluptatibus ab dicta nulla harum optio cumque? Vel dolorum iusto temporibus asperiores, molestias nobis ducimus quos quod dicta, rem, praesentium quidem ipsa blanditiis sint maiores! Nobis minima porro asperiores enim suscipit cupiditate reiciendis, dolores earum qui animi, quidem omnis mollitia. Et, amet vero itaque pariatur fugit sequi officiis, dolorem nesciunt minus, sed magni maiores nulla quasi ducimus! Amet, assumenda eius voluptate accusamus repudiandae quis eveniet. Sint aspernatur alias sequi illo! Eveniet culpa obcaecati deserunt mollitia neque, voluptatem consequatur dolore eum placeat a. Explicabo distinctio eveniet ea odit quia debitis voluptatum officia sunt minima accusamus incidunt, voluptate placeat labore maiores sit pariatur. Doloremque harum reprehenderit molestias molestiae quod delectus. Aliquid, ullam distinctio molestiae dolorum, iusto quo animi inventore provident similique earum laboriosam unde omnis laudantium quis dolore! Beatae aliquid, earum mollitia architecto distinctio provident id autem. Perferendis vero recusandae distinctio et ipsa tempora qui asperiores, nesciunt ea. Nobis, similique. Voluptas, architecto dolorem quaerat atque deserunt quo odit, inventore ipsa quas exercitationem, commodi delectus nobis aliquid soluta ipsum non consequuntur dolorum! Modi dolorem deserunt voluptatum incidunt! Quidem fugiat distinctio excepturi quae error! Nemo sapiente nobis ad reprehenderit veritatis dolorem, consequatur voluptatibus ullam cupiditate laborum voluptatem quod enim atque quas maiores officia modi. Qui ex a totam dolores eos saepe, ratione alias quos doloribus deserunt inventore odit, officiis, quo cumque praesentium sed eius voluptates enim sequi laboriosam! Atque ab dolorem corporis ut ex, quia mollitia minus aliquam facere vero, dignissimos provident! Iusto officia quis, blanditiis dolorem eos fuga mollitia illum, perspiciatis fugiat ipsa beatae, reprehenderit vero? Amet, fuga? Natus, cumque amet? Asperiores fugit placeat temporibus, nobis tenetur in suscipit alias et ullam nesciunt quia veniam maxime facere mollitia possimus quam? Similique voluptatem aliquam earum vel perspiciatis sequi, perferendis fugiat culpa blanditiis aliquid, beatae explicabo illum sunt labore necessitatibus reprehenderit tempore, consectetur eaque quasi. Fugit velit, maxime corrupti possimus sunt architecto laboriosam, numquam esse quos facere minima aspernatur iste excepturi nobis, voluptates dolor totam? Molestiae eius suscipit quidem sit, fugit corporis vel officia adipisci! Laudantium quasi provident ab nisi quidem perspiciatis, quae nam voluptatibus, odio, in maiores! Cumque deserunt maxime nisi. Sed neque optio inventore, deserunt assumenda odio atque beatae deleniti est veritatis nobis sit ducimus accusantium dolorem temporibus explicabo exercitationem officiis. Voluptas odio explicabo ipsa fugiat consequuntur aperiam expedita magnam dolorem voluptatibus tempore. Molestias, modi amet unde, voluptatum blanditiis accusamus nam necessitatibus animi excepturi placeat eum, deserunt saepe quasi! Sapiente, illo. Sunt esse distinctio sapiente labore error reiciendis suscipit dolores autem dolore, maiores odit architecto ea delectus repudiandae alias. Consequatur eaque vero illo, blanditiis quis amet. Sunt eos placeat voluptatibus aperiam aut soluta dolore, earum dolorum cupiditate magni. Ad quibusdam aliquam voluptates eius soluta? Distinctio blanditiis quasi non incidunt eum exercitationem quo architecto, explicabo quod fugiat iste, iure id obcaecati aliquam praesentium tempore sequi vel ratione officiis cum eveniet eius! Eligendi quisquam dignissimos adipisci. Maiores reiciendis sint ipsam mollitia deleniti. Consequuntur, necessitatibus numquam optio id veniam eaque omnis odit dolores saepe unde esse! Fuga saepe, in accusamus similique provident ipsa vero nostrum nesciunt eius? At illo assumenda veniam iusto ab sapiente aperiam, ad mollitia corrupti amet eveniet doloribus nesciunt, modi praesentium error eius facere nisi dolores dicta. Vitae laborum debitis facere fugit labore tempore, delectus mollitia. Nemo similique, ipsam veniam eaque, maxime molestiae facilis error accusantium incidunt nulla earum a pariatur id sunt ipsum, nihil illo. Culpa aperiam quasi explicabo!");
  }
}

class LoremText extends StatelessWidget {
  const LoremText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Porro ratione natus quidem ut incidunt ipsam distinctio rem deleniti libero explicabo, sed laborum doloremque veniam dolor perferendis quasi. Quo provident eaque quas? Repellat dolore enim vitae perferendis ipsum explicabo. Aperiam tenetur dolore explicabo sequi vero error minus velit omnis facilis ex ducimus ratione unde dolorum at molestias beatae, odio culpa dignissimos ullam tempora pariatur hic, impedit quidem? Culpa corporis reprehenderit molestiae impedit? Eligendi, dicta? Perferendis totam quae cumque repellendus debitis facilis saepe laudantium, officia possimus exercitationem porro sunt nostrum praesentium sint architecto ullam? Nulla facere non deleniti inventore fugiat vitae earum fugit? Labore, pariatur molestias reiciendis, excepturi eos nam perspiciatis nisi facere maiores expedita ea recusandae quos iure. Repudiandae amet magni fugit molestiae veniam suscipit mollitia blanditiis non commodi deserunt hic, voluptatum corporis praesentium obcaecati odio sit dolorem facilis veritatis similique! Beatae dolore, delectus necessitatibus hic reiciendis nihil, esse provident, ex voluptatum laboriosam ut quae iste corporis illum quaerat enim numquam tempore maiores at! Natus, eligendi assumenda placeat architecto quidem nulla tempore maiores doloremque beatae cupiditate eius aperiam animi quod rerum debitis error dolore! Vitae illo sequi temporibus facere, dignissimos velit inventore sit voluptatum mollitia molestiae, incidunt officiis cumque aperiam quod, tempora maxime delectus fugiat tenetur architecto quo voluptas nihil modi non. Quae ullam magnam animi non voluptatem debitis ut quibusdam quidem sapiente illo. Nobis ea hic velit ipsam cupiditate. Repellendus rerum error itaque doloribus laborum nulla necessitatibus, labore, dicta debitis adipisci at enim. Ipsam ex reiciendis eius id unde, sapiente tempore, repellat earum distinctio quibusdam, dolorum saepe. Voluptates laborum dolores harum facilis consequatur, ipsum distinctio nam numquam earum tempore fugiat exercitationem, eaque sed voluptatem repellat ipsa repellendus, autem maxime id. Natus nobis eos, sit harum veniam tempora voluptatem. Eius sit neque, doloremque fuga repellendus delectus explicabo a corporis. Illo eos nihil in, recusandae temporibus debitis quis omnis vel harum neque laborum repellat vitae nisi et quisquam minus minima repellendus corporis corrupti! Vitae porro at enim? Atque aliquid neque harum maiores, nulla, nihil fugiat quo nostrum voluptatem impedit quisquam magnam repellat praesentium vero expedita ut, esse iure possimus? Nulla dolorem aperiam deserunt nesciunt officiis minima nobis eaque expedita ad sed vel magni eius itaque quisquam temporibus, consectetur nisi quo? Suscipit porro ipsam doloribus sunt! Reiciendis, numquam quo! Excepturi aliquam error totam cupiditate nobis libero sapiente placeat in debitis eius, temporibus amet nemo modi fuga vel distinctio, voluptatibus tenetur laudantium laboriosam quia? Recusandae maxime quaerat iste sunt? Amet debitis asperiores officiis labore consectetur libero aut voluptates nobis veritatis, repellat eveniet rem atque maiores nihil reprehenderit cumque laudantium! Laboriosam voluptatum, odio vitae dolorem nostrum dignissimos rem natus et tempore, eius optio numquam! Qui, repellat laudantium nam alias illum non quisquam pariatur sequi repudiandae quidem, ea rerum labore maiores eaque ratione. Necessitatibus quod rerum nam porro ex dolore doloribus? Eligendi dignissimos laborum aspernatur est consequatur, dolore corrupti facilis. Cupiditate doloribus provident nihil nobis eveniet, deserunt debitis rem. Odit fugit dolor molestias velit corporis dolorum magni quis praesentium iure officia autem facere, libero numquam quidem laudantium accusamus eveniet eum nulla veniam consequatur quaerat quasi. Quas eos, incidunt accusantium reprehenderit dicta expedita? Quibusdam, quis facere recusandae explicabo et, vel natus repudiandae autem mollitia laudantium ea dolorem odio quidem quaerat incidunt id aut voluptas eum atque ab culpa earum ullam? Voluptatum nesciunt ea nulla doloremque ullam blanditiis officia qui beatae alias debitis, dolores ad natus sint accusamus eum quam dolor perspiciatis voluptates dolorem cum unde enim repellat? Iste cumque animi explicabo, natus minima sunt fuga itaque at modi velit tempore quaerat eligendi iusto aliquam suscipit deleniti necessitatibus, laborum eos! Voluptatem modi explicabo officiis placeat quos cumque doloribus alias quia, deserunt minus, vero dolorem accusamus sapiente, ab eum beatae. Ipsum rem laborum debitis repellendus officiis asperiores commodi facere. Voluptatem odit, explicabo molestias eligendi consequuntur corporis fugiat ipsam ut eaque exercitationem inventore voluptate in pariatur, hic cupiditate doloremque numquam, accusantium vel labore molestiae amet. Asperiores veniam quo placeat culpa molestias fugiat totam, hic accusamus natus consectetur sint atque delectus? Dolorem ipsa excepturi inventore! Cupiditate, aspernatur! Aliquam illum ea ab, provident odit harum aspernatur saepe officiis repudiandae dolor facilis nam voluptatibus alias dolore id maxime praesentium dicta laborum nemo minima ad non impedit totam? Veniam perferendis quaerat itaque excepturi repellat sequi error placeat dolores blanditiis, molestiae quod? Obcaecati, beatae itaque sunt porro et dolorem, reiciendis ad voluptatem officiis quis atque voluptatum nam quasi optio tempore sint minus soluta possimus sequi incidunt iste cum corrupti rerum. Reprehenderit nihil perspiciatis dicta, expedita quae aperiam harum, quis perferendis, beatae numquam at consequatur cupiditate sit? Neque vero odit hic quisquam. Debitis minima necessitatibus nihil voluptatem explicabo cupiditate commodi porro voluptate repudiandae! Error, deleniti iusto et dicta praesentium modi cumque impedit debitis! Esse ducimus doloribus culpa perspiciatis corrupti quae voluptate velit quia molestias laboriosam illum odit quibusdam quos, odio accusantium dolore, facilis fuga deserunt ratione laudantium? At inventore, molestiae deserunt obcaecati doloremque numquam, et iste iusto praesentium dolorem molestias maxime accusamus rem? Dolores nulla, quidem aut, quod facilis corporis impedit recusandae magnam soluta vero iure doloremque quos veniam possimus laudantium natus exercitationem voluptas eveniet maxime perferendis vitae veritatis commodi, voluptatem autem. Reiciendis laborum mollitia tenetur accusamus quae voluptatem hic unde nulla dicta eos, fugiat soluta explicabo deleniti ex autem sit dolores ad, quod veniam magni nostrum enim sed doloremque! Autem veritatis sequi quis perferendis ratione magnam sunt dignissimos repellat mollitia odio beatae dolore, voluptatum, quam natus reprehenderit nulla error quidem aliquam maiores iusto omnis, suscipit cupiditate optio aut! Earum officia soluta obcaecati. Pariatur dolorem dolore cumque esse doloribus, consequatur minus quis eius ex nesciunt corporis earum perferendis odio cupiditate quae ratione! Accusamus soluta laudantium officia possimus est non totam unde delectus dolores sint! Perferendis aliquid ex, inventore reprehenderit quos qui at tempora in est perspiciatis placeat magni harum nulla eum! Consequatur aliquid dolorem provident velit iusto modi saepe esse vitae similique odio deleniti, vero natus totam error id quidem quo incidunt fugit, nulla repellat? Natus blanditiis repellendus fugit, in quas dolores alias provident ratione vel consequuntur quibusdam, voluptates laudantium! Deleniti illo natus id alias tempora fugit molestiae qui. Optio velit dicta, nam aliquid ipsum molestiae facilis laborum unde, vel fugit illum dolorum enim cum minima in quasi magni totam, quo incidunt expedita adipisci neque illo a. Tempora, amet magnam tenetur excepturi, enim molestias perspiciatis repudiandae ipsa quod eius delectus? Illum facilis fugit, asperiores assumenda nisi animi, perferendis aliquam sequi vero debitis laborum error reiciendis voluptas quas totam culpa nihil tenetur suscipit in neque libero veniam amet maiores quos. Commodi, doloribus voluptate officia ratione tenetur repellendus sunt recusandae fugit voluptatem ducimus sed, voluptas aperiam dolor neque delectus cupiditate saepe at velit. Iure, ab quasi! Dolore assumenda ducimus exercitationem saepe minus nam quod, vero perspiciatis rem id tempore excepturi beatae deserunt, libero maiores magnam iusto suscipit ex harum nesciunt eum nobis ab enim! Ex veniam, quidem officia cumque id aperiam odio alias animi nulla dolore suscipit exercitationem unde obcaecati vel sit molestias quod odit voluptates voluptatibus ut error eos quia. Omnis, eaque corrupti quaerat iste enim odit! Odit similique consequatur natus numquam reiciendis asperiores distinctio ipsa quidem perspiciatis ea aperiam enim blanditiis culpa animi voluptate molestiae sunt autem, voluptatibus laudantium magnam molestias, mollitia temporibus? Doloribus, amet. Expedita enim excepturi nihil quibusdam molestiae quis. Odio praesentium ex atque itaque consectetur ipsum laborum illum saepe voluptate libero. Velit, facilis repudiandae. In quam blanditiis, culpa laboriosam ea unde voluptatibus tempora explicabo vel provident distinctio aut minima ipsum asperiores illum temporibus magni impedit possimus. Eum, nemo delectus assumenda deserunt in cumque libero temporibus amet aperiam sequi, nisi esse reprehenderit a minima nobis obcaecati dicta illum similique? Minus culpa placeat quam repellendus provident fugiat aliquam atque quisquam minima sed repudiandae sapiente qui autem, nam modi hic. Deserunt aperiam, quia tempore officiis voluptas dolores blanditiis numquam esse doloremque consequuntur iure. Dolorem recusandae, earum ducimus laboriosam perspiciatis molestiae, nesciunt repellat esse numquam facilis ad natus sint porro, enim qui sunt amet corporis. Minima, asperiores fugit! Assumenda voluptate, reprehenderit facere vel voluptatem unde. Obcaecati, cum. Itaque atque assumenda molestias nobis exercitationem quas quae. Natus praesentium reprehenderit repellat at. Animi rerum cupiditate placeat nulla excepturi quam. Consequatur numquam, sed asperiores dolorem commodi eius soluta error porro deserunt veritatis ab tempora deleniti voluptatem impedit voluptas tenetur corporis totam labore iste blanditiis similique pariatur at dolore. Vitae architecto soluta asperiores. Molestias beatae et facilis id quas enim architecto culpa aperiam. Voluptate, obcaecati? Consectetur aliquid consequuntur veritatis, ipsum corporis dolores nulla nobis hic asperiores, facere ex accusamus iure. Rem ipsa in eaque ad cupiditate ea incidunt debitis asperiores eligendi minus provident natus voluptatum consequuntur commodi aliquid molestias reprehenderit dolor delectus possimus repellat, sed quo odit! Tenetur fugiat neque laudantium impedit distinctio iure, consequuntur corporis nemo odio ea maiores sequi, quia excepturi rem magnam id a nostrum ullam accusantium. Minima, cumque? Maxime labore, cum dolores omnis voluptatum totam placeat illo eius quis necessitatibus est corrupti, laborum vero quasi obcaecati reprehenderit rerum voluptatem dolor optio voluptas officia nihil. Aspernatur aut, harum perspiciatis consequuntur non qui placeat eum praesentium velit officia iure voluptate accusamus, illo excepturi veniam. Debitis cumque possimus autem dicta voluptatem, officia earum at beatae soluta? Maxime, porro dolores ut iure facere explicabo itaque. Et maiores natus veniam quae impedit, ut earum placeat dolore sequi officiis in quia ea iste accusantium modi dolorum cumque dolorem delectus harum amet voluptates enim! Perferendis, consequatur! Ex iusto laudantium eius nemo cupiditate nesciunt, rerum veniam optio architecto explicabo! Laudantium quas perspiciatis cupiditate maiores. Aperiam ratione neque quidem? Optio, est porro eos at quia autem dolor dicta dolorum quasi tenetur officiis iusto quaerat eius officia nobis id in aliquid. Aliquam, odit. Esse nulla eaque iure dicta ab odio repellat, rem ad fugiat hic neque rerum dolorum incidunt beatae maiores unde eum. Eveniet nulla placeat earum repellendus accusantium expedita esse nam dolore voluptates sint? Facilis, provident. Quos earum necessitatibus sed veniam. Quod distinctio facilis ipsum fuga minima. Consequuntur fugiat maxime porro ab deserunt voluptatibus molestias ipsam at dolore mollitia dolorem quo tempore odit dolores officiis nulla, culpa in, facere quod ea sit vitae rerum consequatur. Nisi tenetur ut officia ipsa odio modi reiciendis eos optio, nemo aliquid molestiae animi ea voluptatibus deleniti rem voluptatum eum soluta dignissimos incidunt perspiciatis veniam rerum consequatur quo! Aut doloribus debitis explicabo maxime cumque fugit tempore blanditiis, natus ab perferendis, dolorem delectus corrupti consectetur voluptas vel possimus fuga provident rem? Nulla excepturi molestiae tempora qui molestias voluptatibus aliquid saepe ducimus, minima necessitatibus enim earum. Numquam nobis reprehenderit iure ut at ipsam dolorem, saepe asperiores rem possimus minima repellendus earum culpa nulla nemo aliquam recusandae, impedit ad quam nihil alias. Quos itaque maxime dolores velit a, eligendi asperiores qui obcaecati quis, aspernatur explicabo harum in tempora provident! Ad temporibus illum distinctio quidem dolor veniam, et incidunt odit omnis voluptatibus officia voluptas nihil consequuntur harum id. Nulla iusto dolor enim? Nobis repellendus tempora ratione voluptatum culpa, quibusdam maiores repudiandae deserunt enim nisi incidunt. Fugiat obcaecati nihil rem quisquam culpa! Enim distinctio laborum necessitatibus quas optio, mollitia rem eius cum quidem harum velit repellendus, ad assumenda quaerat hic ipsam quam vero sunt officia itaque repellat a! Sunt mollitia magnam repudiandae! Voluptatem iusto reprehenderit ipsa et! Ratione doloribus alias rem, molestiae praesentium deserunt animi fugiat voluptas id nam cum vel illum quam, ipsam fugit beatae delectus ipsa magni amet culpa nihil quas unde. Nam, error labore? Eius, vel quas odio rerum, odit deserunt nostrum consequuntur aperiam sit dignissimos libero quis ut laboriosam veniam assumenda reiciendis laudantium deleniti voluptatum itaque. Blanditiis sint eius temporibus iste soluta minus est enim dolorem? Quod, eos? Neque temporibus saepe maxime dolore similique. Unde esse voluptates quo accusantium sunt quis, repellat saepe numquam eius facere delectus aliquid optio? Alias rem consequuntur nam expedita nemo nesciunt ea eaque quasi suscipit vitae aperiam minima aut doloribus cupiditate esse dignissimos qui ullam, aspernatur debitis tempora sint blanditiis, dolorem perferendis. Harum enim incidunt impedit omnis vitae sed qui ipsa, modi facilis, iusto, eius ullam. Accusantium eos dolorum sequi, eligendi iusto maxime unde quam rerum cumque earum tempore minima recusandae ab pariatur tenetur quidem molestiae sapiente, placeat consectetur voluptate quo laudantium suscipit! Laudantium nihil quisquam ratione consequatur perspiciatis? Magnam quos dolorum, excepturi odio sapiente assumenda non. Ea blanditiis qui ipsam architecto libero. Blanditiis quos pariatur, est, tenetur rerum excepturi amet, consectetur perspiciatis aspernatur culpa porro fugit? Quos doloremque accusantium aliquid voluptatem, vitae vero. Ratione animi tenetur consequatur, itaque, amet, id est maxime dignissimos facere quis recusandae? Fugiat mollitia est iure sit eaque incidunt nobis velit optio corporis iste autem odio quae minus labore veritatis quos vitae quibusdam alias quas, esse voluptatum itaque ipsam. Cupiditate, officia omnis quis eum labore dolore dolorem officiis. Velit voluptas quidem autem assumenda, reprehenderit iure, nostrum cupiditate cum placeat temporibus et ratione repellendus error, tenetur eum facere ea possimus voluptates molestias quaerat ipsum tempora exercitationem magnam! Ducimus necessitatibus sed atque nulla nemo assumenda veniam vitae architecto sint libero! Soluta, quisquam ducimus magnam suscipit ut quaerat tenetur, doloribus quidem quia impedit, ipsam et laborum? Qui suscipit iusto est voluptate dolorum ipsum, doloribus veritatis, porro nisi atque voluptatibus alias dicta numquam accusamus distinctio cupiditate quaerat. Velit cupiditate in placeat modi earum ad dolorum officia repellendus. Aperiam ea temporibus vitae autem inventore quaerat alias aspernatur eos explicabo voluptas facilis magni, exercitationem suscipit eaque, deleniti expedita nesciunt est a. Magnam eos in, dolorem perspiciatis minima cupiditate beatae exercitationem at consequatur magni odio ex dolore rerum omnis quo est ea laboriosam sunt animi quisquam provident veritatis nisi id. Consectetur repudiandae nesciunt vero, doloribus incidunt non ullam nam sed eveniet officia ipsa, laboriosam perspiciatis ratione ea doloremque, voluptate iure laborum expedita? Quos excepturi eos ipsum, beatae temporibus ea repudiandae nam, vitae rerum architecto minus dolorem iste neque laborum a magni repellat consequatur incidunt ipsa quo quam quasi sint. Molestias veritatis porro itaque sapiente ipsum ducimus. Hic reiciendis, explicabo tenetur commodi pariatur vel culpa quidem dicta dignissimos dolores rerum autem doloremque quis maxime, odio quia molestiae. Accusamus, minima ipsum omnis, quos facere quas alias perspiciatis illo voluptatum quae veniam fuga quisquam! Magnam architecto quidem fuga minima, praesentium nihil saepe totam inventore vel in blanditiis hic voluptatibus provident repellat, nisi laudantium expedita libero dolore. Tempora officiis sit cum quasi a mollitia? Adipisci perspiciatis dignissimos sit nam repudiandae molestias laboriosam harum dolores vero consequatur unde, exercitationem illum officia eum, veniam quia quae consequuntur perferendis atque sapiente voluptate reiciendis natus tempore possimus! Eaque nesciunt, iure odio minus quis repellat quisquam. Earum excepturi dolores asperiores molestias, perspiciatis corporis. Illo temporibus consequuntur laborum molestias animi velit eligendi id optio inventore dolore quos labore accusantium, eveniet alias! Officia tenetur doloremque, vitae nulla iusto consequuntur pariatur iure saepe ipsum odio voluptatem ex voluptates beatae ab tempora! Expedita quis eaque accusamus laboriosam repellat deserunt aperiam! Eligendi vitae et animi reprehenderit porro, non odit? Dolores officia enim ad expedita iure voluptas eligendi unde earum non ipsum rerum eum, impedit ex, cumque minima, iusto voluptatem. Perspiciatis adipisci quo atque ab laudantium, eum aspernatur perferendis! Qui numquam, asperiores eaque blanditiis corporis, reiciendis quia consequatur nesciunt similique cum quibusdam laborum, repellat officiis odit nisi neque sint nemo dolore incidunt ea quae culpa assumenda? A omnis nulla quia ratione vitae nostrum deleniti accusantium saepe velit, doloribus nam praesentium vero labore explicabo laudantium. Delectus exercitationem eveniet voluptatibus a laudantium eos eligendi dolorem est aliquid non? Nobis libero temporibus adipisci? Suscipit iure exercitationem perferendis voluptas, alias cum sed esse voluptatum magni eveniet facilis asperiores id itaque ullam corrupti fuga recusandae blanditiis tempore illum vel minima aliquid cupiditate. Quod nesciunt, quae iste commodi est ut expedita ex modi! Nemo dolore sed veritatis fuga libero quas repellendus aut praesentium. Cumque nisi neque doloremque nobis doloribus. Reprehenderit commodi et aliquid, dolores alias fugiat at perferendis tempore, ratione maiores fuga tenetur optio accusamus fugit molestiae quia beatae, expedita ex. Alias, delectus explicabo libero, facilis adipisci aut esse accusantium nulla debitis eveniet odio expedita. Dolores dolorem, accusamus quo commodi earum maiores, corporis dolor alias enim esse totam unde laboriosam atque sint deleniti fugit dolore necessitatibus! Labore cumque corporis quae sunt saepe assumenda et natus, rerum modi quis iste sit excepturi esse libero tenetur, fugit omnis tempore? Quis ex rem sequi exercitationem error placeat, aperiam animi sed iste pariatur, aliquid ratione soluta ab minima mollitia? Quo saepe tempora, corrupti molestias delectus dolor quidem autem, eum quos voluptates ipsum impedit! Minus eaque, ut inventore nihil dolore autem porro ipsam facilis repellendus voluptates sed fugiat delectus saepe aperiam debitis? Sint optio distinctio unde accusamus! Quibusdam nulla delectus voluptatibus autem est unde laboriosam minus libero laborum, saepe a deserunt nesciunt totam consectetur cumque impedit odio blanditiis recusandae facilis tempore obcaecati minima necessitatibus nihil id. Est quas adipisci cupiditate fuga error ab unde reprehenderit maxime, delectus perspiciatis, vero dolor itaque aut? Ut, quod atque. Obcaecati qui sapiente quam itaque quia quibusdam similique commodi quasi molestias architecto ipsam odit nemo, dolorem nostrum, accusantium iure esse modi hic harum id! Dolore debitis, dolores qui aperiam, nobis alias nulla quidem iure ab suscipit labore vitae deleniti fugit dolor. Deleniti, porro, molestias voluptates praesentium tempore animi velit, repudiandae suscipit error aspernatur mollitia nemo! Voluptas at repudiandae nobis laudantium quo consequuntur iusto eum sint eos obcaecati? Saepe eius reprehenderit provident deleniti laboriosam voluptates quo vitae explicabo vel, tempora quae itaque? Alias consequuntur consectetur soluta debitis, mollitia, placeat similique at quos cupiditate corrupti doloribus quo aliquid numquam praesentium eveniet earum excepturi repellendus sunt temporibus nulla? Possimus consectetur saepe neque sunt sint non aperiam debitis perspiciatis ab vitae repellat, doloribus tempore explicabo fugiat. Quidem excepturi perspiciatis itaque voluptates necessitatibus quam! Beatae quis modi quaerat accusamus voluptas, quae exercitationem laborum quas vitae, tenetur odio natus enim, vel rem excepturi nemo et earum alias eos rerum sequi ea voluptates voluptatum? Expedita ab nisi, perferendis, eligendi, quis possimus enim sint repellat aperiam neque ipsa hic laudantium! Quaerat eum ducimus, nemo suscipit numquam reiciendis, aliquam excepturi architecto minus cupiditate repellat. Obcaecati provident velit doloremque iste hic, tenetur nisi, at dignissimos tempore similique ratione neque? Voluptatem quisquam harum magni totam sunt vero, debitis repudiandae nihil exercitationem esse asperiores aliquid ratione omnis laudantium distinctio voluptas sapiente! Fugit similique ipsum deleniti, placeat quas dolor illo assumenda. Fuga, hic unde! Ullam dolorem, ducimus, sunt exercitationem ut earum ex, beatae voluptatum recusandae reiciendis accusamus explicabo natus aliquid animi deserunt pariatur velit aut commodi consequatur voluptas itaque! Iste necessitatibus delectus autem provident, fugiat maiores quam. At, ducimus reprehenderit! Iusto et quia in, dolorem mollitia praesentium tempore, facilis vel quos tempora enim reiciendis, eos omnis repellendus. Sapiente cupiditate corrupti, a ad quo non placeat nemo neque. Reprehenderit magni odit suscipit ipsam ullam iusto nam consequatur odio incidunt, blanditiis vero, repudiandae officia quidem harum eligendi sed debitis provident corrupti impedit inventore. Ab a velit dolore similique aliquam aliquid suscipit voluptatem, rerum, dolor, amet necessitatibus sed in tempore quam saepe? Ex natus dolore doloribus ratione voluptates, ducimus explicabo. Distinctio praesentium nobis magnam illum numquam repudiandae voluptate, corrupti excepturi facere sequi modi beatae et dolor enim eum quo itaque. Numquam repellat, laborum facilis distinctio eligendi facere. Nisi minima dolorum sed est similique eius pariatur exercitationem, voluptates tempora, ratione dolorem inventore libero ipsa. Cum harum quos amet quisquam doloremque accusantium, labore exercitationem expedita tempore facere ipsam dolorum aut, necessitatibus praesentium quasi. Doloribus a libero est, unde enim et officia tempore, rerum cupiditate architecto velit sapiente labore iure veniam sequi, ullam harum aspernatur reprehenderit eos. Saepe dolorem modi perspiciatis blanditiis deserunt. Sit at vel error ipsum cumque nostrum dolore fugit! Aperiam nisi praesentium dolor rerum similique suscipit vitae commodi, ipsam dolores id cupiditate aspernatur error quidem, earum recusandae deserunt atque nihil. Minima voluptatibus laborum autem deserunt, excepturi vero dolores recusandae, odit saepe, tempore culpa assumenda quas sunt molestias ad eaque reiciendis cupiditate harum at possimus velit eos? Quos consequuntur deserunt expedita dolore necessitatibus hic fugit, similique nemo rerum esse nulla et nihil beatae iure? Minus, quidem. Fugiat omnis vitae odit quisquam enim voluptatem modi veritatis eius non, delectus voluptates aspernatur, inventore accusantium nobis, dignissimos ullam eum maiores harum? Quod tempora quis sequi, animi asperiores maxime autem, repellendus quo libero magnam beatae voluptas sapiente voluptate. Tempore ad nostrum repellat laudantium, enim nemo in debitis exercitationem pariatur voluptatibus perferendis eligendi voluptas voluptatum repellendus, dolorem recusandae corporis non sed blanditiis! Repellat natus voluptatum ipsum, minus blanditiis nam maxime eum consequatur, laboriosam odio expedita quidem et saepe quas cum vitae molestias repellendus tempore quo officiis excepturi libero quae ducimus. Praesentium dignissimos maxime perferendis accusantium consequatur, ipsum in, voluptatibus natus inventore quod nemo. Reprehenderit molestias in qui. Delectus accusantium adipisci molestias placeat magnam dolorem ducimus nisi? Dolor inventore at officiis placeat dignissimos delectus cumque, nobis consequuntur, unde saepe alias cum aperiam veritatis possimus iste excepturi eum? Quaerat iste, tempora praesentium consectetur explicabo pariatur nam excepturi delectus cupiditate eum nobis minima. Alias iure modi, architecto provident cupiditate libero dignissimos, excepturi accusantium sunt harum ratione, quae dolores asperiores eum vitae? Similique consequatur ratione officia numquam soluta quo sint facere earum architecto nulla molestiae, iusto ut illo sapiente, commodi voluptatum placeat porro. Error unde adipisci, provident optio suscipit, amet nam culpa, placeat dolore laboriosam nisi fuga sed temporibus architecto dolorum voluptas voluptates iste id fugit reprehenderit quam accusantium. Quidem et dignissimos ex culpa quas totam, illum architecto rerum officiis! Animi eaque molestias aut voluptatibus eligendi, perspiciatis deserunt enim accusamus sint, voluptatem quod! Nesciunt ratione qui quam dignissimos! Voluptatum quisquam, dolores quas eos, velit fugit ut, ad consequatur eveniet delectus eum deleniti quos sit culpa rem voluptas vel eaque saepe sint quam libero repellat. Nesciunt, necessitatibus. Eligendi vel voluptatibus voluptate, consequuntur consequatur excepturi? Aut iusto veniam mollitia, consequatur numquam ratione a reprehenderit officia, soluta eveniet accusantium eos assumenda minus neque esse excepturi quisquam officiis architecto voluptatum. Perferendis veritatis quae officiis esse numquam dolorem harum quaerat, enim libero ullam, cum magnam facere nisi quidem natus et rem minima nostrum minus eaque molestiae eveniet corporis eius? Architecto sequi totam animi aliquam eum deleniti est saepe asperiores illum modi. Molestias, tempore voluptate incidunt exercitationem vitae ad fuga odio inventore blanditiis eius aperiam? Earum, libero, quaerat aliquid itaque perspiciatis corrupti mollitia explicabo odit aut tempore quibusdam totam animi laudantium vel facere modi adipisci ex! Fugit, commodi. Non praesentium itaque accusamus, vitae iste magnam at quidem numquam ipsum ut laudantium provident corrupti quae iusto suscipit consequatur iure facilis maiores atque ducimus consequuntur? Eligendi voluptate, recusandae explicabo nihil illum molestias magnam quaerat sint odit animi sed mollitia quia, a laudantium neque corporis quas alias, deleniti asperiores nesciunt repellat. Repudiandae asperiores numquam tempore ab? Perferendis repellat recusandae consequuntur eius laboriosam sapiente eveniet. Placeat sint architecto animi iusto atque numquam itaque! Animi fuga inventore ducimus, natus error soluta odit tempore quas illo labore ex sed nam adipisci, ea est tempora officiis ullam totam possimus eius. Rem ipsa repudiandae atque saepe commodi sit molestiae, aliquam cum beatae. Voluptate, ab? Dolorum et modi perspiciatis amet nam cum dolores ipsa, nostrum at nisi iure eligendi accusamus repellendus debitis quod doloremque id quis optio magnam officia? Debitis impedit iste veniam dolores accusamus eveniet, reiciendis culpa, quas, labore ex asperiores optio? Voluptatem perspiciatis repudiandae enim impedit vero pariatur quidem eligendi cumque veritatis eaque nemo perferendis odio sint unde sunt tempora molestias repellendus illo, vel consequatur sequi ex cum odit. Explicabo beatae quibusdam excepturi recusandae! Impedit deleniti dolore veniam odit itaque reiciendis laboriosam aliquid eius, incidunt, perferendis quas delectus suscipit ab non necessitatibus! Deleniti accusantium cupiditate laborum nulla, ab beatae itaque ad a maiores voluptas adipisci, hic dolorem officia. Id veniam dolorum quidem quis tempora, dolore, dicta magni deserunt eius, explicabo provident. Numquam, maiores aspernatur nulla totam rerum eaque laborum ipsam aliquam iusto facere ea corrupti a sapiente ab libero. Excepturi aliquid totam molestias cumque voluptate aspernatur ut, molestiae ad, vitae eaque blanditiis facilis soluta dolorum possimus aperiam numquam facere dolores deleniti odit ratione temporibus nesciunt, eos enim! Obcaecati cupiditate dolor saepe incidunt dolore repellat temporibus error dicta architecto quo neque, doloribus provident officia. Est eum unde quam quo quas hic sit maiores itaque labore voluptatem voluptatum placeat commodi, reprehenderit omnis saepe ea dolorum a dolore necessitatibus, molestiae, in quis cupiditate! Ab quasi, quisquam aperiam magni deleniti blanditiis maxime accusantium suscipit mollitia ex animi recusandae unde voluptates maiores libero ea corrupti qui cum tempora reprehenderit fugit commodi sequi! Nisi, id. Omnis atque sapiente, qui praesentium necessitatibus soluta molestias doloremque ad esse illum voluptatibus. Eos, laudantium vitae exercitationem illo minima minus sapiente sint atque ullam consequuntur quasi cum ducimus dicta voluptatem iure? Illo, optio facere odio similique id saepe omnis quibusdam deleniti pariatur a at explicabo adipisci dolores aut sed quam. Sit beatae modi incidunt quos nisi similique soluta animi! Explicabo iste ducimus tempore commodi architecto reiciendis doloremque odit modi debitis ipsa hic, tenetur eos aliquam rerum aut, in adipisci quam quisquam alias et voluptas aperiam, cumque beatae. Commodi iure inventore corporis autem iste exercitationem error vero. Ipsam cumque esse perspiciatis quod, non placeat. Cum quod esse culpa velit beatae ullam perferendis dolorem eveniet, odit recusandae soluta incidunt debitis delectus placeat nobis saepe alias quos enim cupiditate illum earum est? Officiis aut nostrum accusamus suscipit provident saepe tempora in, sit, delectus ratione earum quidem culpa sunt unde doloribus id error iusto cumque voluptas assumenda excepturi amet sequi sed. Placeat sunt explicabo consequuntur eligendi vero id ducimus aut blanditiis, aperiam quos earum facere voluptate autem. Repellat recusandae minima dicta blanditiis tenetur animi dolorem quasi beatae quia sequi nesciunt qui expedita dolorum quaerat molestiae earum, sunt vel. Architecto aliquam libero amet hic rerum blanditiis voluptatibus laborum. Tempora, voluptatibus optio. Soluta labore harum cupiditate, repellendus molestiae eius libero nulla officia ipsam nesciunt rem, magni minus consequuntur voluptatibus quisquam assumenda earum velit eaque autem! Aliquid, tempora debitis ab consectetur possimus explicabo ipsa mollitia suscipit magni similique quidem placeat ut commodi voluptatum repudiandae doloremque natus, iusto delectus quaerat deleniti necessitatibus! Necessitatibus nihil qui ab illo ipsa? Quisquam modi laborum facere repellendus quasi sapiente, placeat esse dicta quae illo quibusdam voluptate et magni. Est qui exercitationem omnis quidem expedita nemo, placeat perspiciatis quam quis blanditiis rerum nam molestias cum magnam vero enim obcaecati sapiente sunt rem et. Quo optio reprehenderit voluptatum vitae cumque officiis fugit doloribus! Quos magnam expedita libero accusamus dolore adipisci officia facilis quo a cum! At accusamus reiciendis, pariatur dignissimos deserunt perspiciatis esse odit, sit non maiores, animi labore? Aut odit voluptatem inventore nisi beatae accusantium laborum dolorem, nesciunt, asperiores sint consectetur animi esse ratione fugit, corporis suscipit amet repudiandae cum dolor. Laboriosam quibusdam fuga cumque aliquam consequuntur voluptates eaque ut, culpa, ab modi itaque eligendi eos tenetur rerum delectus ea. Sunt vero eveniet dolores voluptatibus velit sint distinctio esse praesentium consequatur tenetur excepturi amet nemo ipsam aspernatur architecto libero reiciendis provident magni officiis, natus cupiditate magnam eius? Maiores optio, dolore aut aspernatur esse delectus libero quis ea. Ullam porro aliquam repudiandae itaque totam corporis praesentium sint. Enim neque cumque libero praesentium voluptatum doloribus provident culpa alias ea repellat aliquam, repellendus repudiandae dolores voluptas. Suscipit dignissimos autem adipisci labore quisquam inventore assumenda, accusantium nulla minus dolor tempora similique numquam optio incidunt consequuntur recusandae iure veritatis qui vero ut eius voluptatum cum! Iure facere, ullam sapiente autem aliquam at, eius, iste tempore maiores aut fugit delectus numquam. Vero aspernatur iure vitae nemo laboriosam. Iste minus repellendus magni hic a error, modi similique sed distinctio aliquam necessitatibus ad, cum dignissimos obcaecati, consequuntur inventore totam sequi at libero facilis molestias deleniti? Repellat corrupti voluptatem veniam mollitia quas quasi omnis dolorem dicta aut, quae quibusdam cupiditate facilis eligendi debitis sequi ipsam, nihil, explicabo magni veritatis illum molestiae error aliquam quidem. Itaque, quia quam debitis quis et hic ratione consequuntur porro dolor exercitationem aspernatur eligendi quasi optio ea ab atque amet corrupti esse ullam! Veritatis, quis cumque cum, placeat animi repellat ipsa officiis adipisci libero ad hic voluptatem commodi ut, vel iste ratione eaque aspernatur corrupti optio accusamus molestias quisquam id nobis quam? Odio tempore nesciunt inventore cumque modi rerum soluta cupiditate quidem itaque architecto quisquam harum qui quod magnam quo dolorum ut, saepe laudantium culpa. Numquam ipsum molestias et dolorum adipisci, est labore soluta blanditiis eaque accusantium eum vero temporibus magni! Ut nostrum consequatur totam obcaecati ipsa at odio labore nam! Laboriosam dolorem libero eos! Sint harum ab delectus saepe? Unde enim cumque autem. Sequi vero sapiente rerum alias cupiditate aut enim soluta veritatis atque culpa eius distinctio rem aliquid nihil, minima beatae. Nesciunt, laborum, sed illum corporis enim alias necessitatibus laudantium dignissimos earum consectetur nulla temporibus maiores illo debitis iure porro repellat animi. Nulla, tenetur, praesentium ipsam rerum quisquam inventore magnam quia recusandae in sequi et molestias distinctio deserunt repellat ad asperiores natus dignissimos fugiat laboriosam vero, dolore aliquam corporis optio excepturi? Delectus odit iure ipsam nam eius impedit, unde ex laborum architecto autem molestias. Iusto tempore porro dicta quis ullam maiores, fuga fugit nihil facere officia minima placeat quae vero quasi quia saepe labore repellat nulla blanditiis quidem deserunt ducimus modi voluptates. Reprehenderit sed beatae iste quaerat obcaecati, commodi nihil magni numquam cumque esse accusantium similique praesentium aliquam est unde! Vitae, explicabo. Nihil sequi voluptatem saepe explicabo, dolor quis est! Perferendis similique, impedit atque ipsum illo vero omnis, aliquid non quia beatae, incidunt eius ab quidem esse iure labore! Doloribus exercitationem dolorem deserunt, enim non, atque maiores nostrum nisi repudiandae recusandae incidunt ratione, necessitatibus maxime dolor odio quisquam temporibus cum debitis quaerat ut aut? Voluptate facilis aperiam iure eum inventore saepe ex in consequatur veritatis corporis id aspernatur harum, beatae laboriosam dicta animi vel dolore hic ad nihil illum necessitatibus facere? Fugit ducimus sunt laborum possimus repellat saepe quod dolorem facilis commodi iusto impedit aspernatur a mollitia sequi qui voluptatem enim architecto corrupti, asperiores illo ratione nostrum? Ad nam eveniet quas magni similique voluptatem aspernatur qui commodi cupiditate. Quam eaque iusto tempora necessitatibus ex, illo ipsam repudiandae quidem nostrum expedita in hic maiores doloribus non voluptate cupiditate distinctio fugiat! Sunt maiores corporis officia ducimus! Unde, quia quos dolor reprehenderit iure aspernatur, a ipsam laboriosam maxime hic itaque sequi! Tenetur unde corporis iste id perspiciatis vitae, optio dolores nostrum earum excepturi nulla libero vero velit aperiam fuga eius illo quia ipsa dicta! Non consequuntur, molestiae deserunt eveniet similique doloribus nam perspiciatis, recusandae quaerat autem eius fugiat quam ea aspernatur nobis suscipit, illo necessitatibus est delectus ducimus ut! Quas vitae, soluta quaerat vel dolorem consequuntur! Molestias, in! Quasi esse, adipisci officia fuga eius ab eveniet nobis voluptates voluptatibus maxime accusamus aspernatur earum, laudantium libero dolore. Possimus saepe placeat vel et ut pariatur eius fugiat? Perspiciatis officiis non error voluptates! Cupiditate atque sint quibusdam eveniet eos vel commodi distinctio! Fugiat dolorum officia ipsa impedit laborum veritatis veniam tempore asperiores odio cumque cupiditate, id et possimus, voluptatem error iure saepe delectus in culpa quasi? Rem id excepturi, corporis, fugit omnis ad nulla, rerum a dolorem quibusdam at repellendus modi molestiae facere! Ab voluptate, facilis, maxime obcaecati molestiae iure possimus qui saepe veritatis explicabo tenetur est tempore, repellat doloribus nulla incidunt totam. Nihil dolor libero molestias sapiente ab animi officiis doloremque voluptatibus odio atque natus totam fugiat ipsa iusto obcaecati beatae dolorum, vero, rerum provident odit pariatur possimus est! Fugit impedit dolorem accusamus dolore, ullam soluta blanditiis laborum eum facere molestias dignissimos vitae, tempore nemo reprehenderit quasi ex optio animi neque autem minima. Cupiditate quia impedit quam error iste placeat minima sit animi ipsum similique in reprehenderit nesciunt quasi earum commodi optio veritatis officia exercitationem esse, eveniet eos! Distinctio, iusto eum. Libero molestiae nisi sequi itaque ea expedita aliquid, omnis cum quisquam voluptatem error fugit, dolorum, molestias blanditiis. Assumenda ad necessitatibus voluptatem ut ipsam culpa dolores vel, voluptate, repellat ipsa quo itaque perspiciatis? Aliquid eum dolorum, beatae quisquam nam eligendi asperiores magni ipsam exercitationem aperiam vero quidem enim officiis saepe amet autem repudiandae deserunt perferendis facilis libero necessitatibus excepturi facere? Deleniti ducimus dicta hic? Ad, exercitationem. Tempora non labore nihil obcaecati quis error maxime repellat fuga dolor quos ducimus, deserunt exercitationem quasi, numquam excepturi amet unde consequuntur delectus cupiditate voluptas pariatur? Obcaecati harum minima minus, voluptate cumque nam atque, exercitationem a aliquid blanditiis sequi quidem quaerat doloribus molestiae? Eius dignissimos quam unde blanditiis officia aut, perferendis, molestiae excepturi consectetur corporis numquam culpa doloribus maiores ex exercitationem id voluptates cupiditate? Doloribus illum atque saepe temporibus cupiditate commodi. Sit blanditiis obcaecati illo saepe et dolorem placeat, eveniet autem nostrum corrupti facere rerum aliquid iusto. Tempora laborum vero neque quae quasi, exercitationem molestias voluptas sunt culpa voluptatem, qui pariatur eaque, necessitatibus facere! Itaque iste ab ipsam perferendis. Saepe voluptatem amet debitis temporibus quasi consequuntur incidunt, vitae dolorum doloremque quos nisi. Tempora libero ducimus dolores numquam praesentium commodi debitis dolore nemo et veritatis beatae assumenda deleniti aliquid, ab delectus distinctio, reiciendis cupiditate similique sequi? Rem itaque commodi nulla ducimus doloremque accusantium reiciendis dicta maiores, quas in odio dolorem, fugit impedit, blanditiis explicabo illo quisquam vero vitae. Ex eaque eius rerum reiciendis sequi, ab veniam? Adipisci natus, molestiae nesciunt quos at ipsum sequi perspiciatis ullam rerum qui nisi error aliquid. Ab excepturi dolorem molestiae, voluptas explicabo aperiam, voluptates quia totam minus perferendis et quae. Fugiat aspernatur quasi quibusdam corporis voluptatibus ab dicta nulla harum optio cumque? Vel dolorum iusto temporibus asperiores, molestias nobis ducimus quos quod dicta, rem, praesentium quidem ipsa blanditiis sint maiores! Nobis minima porro asperiores enim suscipit cupiditate reiciendis, dolores earum qui animi, quidem omnis mollitia. Et, amet vero itaque pariatur fugit sequi officiis, dolorem nesciunt minus, sed magni maiores nulla quasi ducimus! Amet, assumenda eius voluptate accusamus repudiandae quis eveniet. Sint aspernatur alias sequi illo! Eveniet culpa obcaecati deserunt mollitia neque, voluptatem consequatur dolore eum placeat a. Explicabo distinctio eveniet ea odit quia debitis voluptatum officia sunt minima accusamus incidunt, voluptate placeat labore maiores sit pariatur. Doloremque harum reprehenderit molestias molestiae quod delectus. Aliquid, ullam distinctio molestiae dolorum, iusto quo animi inventore provident similique earum laboriosam unde omnis laudantium quis dolore! Beatae aliquid, earum mollitia architecto distinctio provident id autem. Perferendis vero recusandae distinctio et ipsa tempora qui asperiores, nesciunt ea. Nobis, similique. Voluptas, architecto dolorem quaerat atque deserunt quo odit, inventore ipsa quas exercitationem, commodi delectus nobis aliquid soluta ipsum non consequuntur dolorum! Modi dolorem deserunt voluptatum incidunt! Quidem fugiat distinctio excepturi quae error! Nemo sapiente nobis ad reprehenderit veritatis dolorem, consequatur voluptatibus ullam cupiditate laborum voluptatem quod enim atque quas maiores officia modi. Qui ex a totam dolores eos saepe, ratione alias quos doloribus deserunt inventore odit, officiis, quo cumque praesentium sed eius voluptates enim sequi laboriosam! Atque ab dolorem corporis ut ex, quia mollitia minus aliquam facere vero, dignissimos provident! Iusto officia quis, blanditiis dolorem eos fuga mollitia illum, perspiciatis fugiat ipsa beatae, reprehenderit vero? Amet, fuga? Natus, cumque amet? Asperiores fugit placeat temporibus, nobis tenetur in suscipit alias et ullam nesciunt quia veniam maxime facere mollitia possimus quam? Similique voluptatem aliquam earum vel perspiciatis sequi, perferendis fugiat culpa blanditiis aliquid, beatae explicabo illum sunt labore necessitatibus reprehenderit tempore, consectetur eaque quasi. Fugit velit, maxime corrupti possimus sunt architecto laboriosam, numquam esse quos facere minima aspernatur iste excepturi nobis, voluptates dolor totam? Molestiae eius suscipit quidem sit, fugit corporis vel officia adipisci! Laudantium quasi provident ab nisi quidem perspiciatis, quae nam voluptatibus, odio, in maiores! Cumque deserunt maxime nisi. Sed neque optio inventore, deserunt assumenda odio atque beatae deleniti est veritatis nobis sit ducimus accusantium dolorem temporibus explicabo exercitationem officiis. Voluptas odio explicabo ipsa fugiat consequuntur aperiam expedita magnam dolorem voluptatibus tempore. Molestias, modi amet unde, voluptatum blanditiis accusamus nam necessitatibus animi excepturi placeat eum, deserunt saepe quasi! Sapiente, illo. Sunt esse distinctio sapiente labore error reiciendis suscipit dolores autem dolore, maiores odit architecto ea delectus repudiandae alias. Consequatur eaque vero illo, blanditiis quis amet. Sunt eos placeat voluptatibus aperiam aut soluta dolore, earum dolorum cupiditate magni. Ad quibusdam aliquam voluptates eius soluta? Distinctio blanditiis quasi non incidunt eum exercitationem quo architecto, explicabo quod fugiat iste, iure id obcaecati aliquam praesentium tempore sequi vel ratione officiis cum eveniet eius! Eligendi quisquam dignissimos adipisci. Maiores reiciendis sint ipsam mollitia deleniti. Consequuntur, necessitatibus numquam optio id veniam eaque omnis odit dolores saepe unde esse! Fuga saepe, in accusamus similique provident ipsa vero nostrum nesciunt eius? At illo assumenda veniam iusto ab sapiente aperiam, ad mollitia corrupti amet eveniet doloribus nesciunt, modi praesentium error eius facere nisi dolores dicta. Vitae laborum debitis facere fugit labore tempore, delectus mollitia. Nemo similique, ipsam veniam eaque, maxime molestiae facilis error accusantium incidunt nulla earum a pariatur id sunt ipsum, nihil illo. Culpa aperiam quasi explicabo!");
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        // itemCount: tabs.length,
        // gridDelegate:
        //     const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: // (BuildContext context, int index) =>
            List.generate(
      tabs.length,
      (index) => Container(
        padding: const EdgeInsets.all(18),
        // alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(18),
        //   color: Colors.black.withOpacity(.5),
        //   image: const DecorationImage(
        //       image: NetworkImage(
        //           "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
        //       fit: BoxFit.fill),
        // ),
        height: 190,
        width: 180,
        child: //Column(children: [
            InkWell(
          onTap: () {
            Get.to(() => const DetailPage());
          },
          child: Column(
            children: [
              Container(
                height: 100,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black.withOpacity(.5),
                  image: DecorationImage(
                      image: AssetImage(tabs[index][1]), fit: BoxFit.fill),
                ),
                // child: ClipRRect(
                //   borderRadius: BorderRadius.circular(16),
                //   child: Image.network(
                //     "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                //     fit: BoxFit.fill,
                //     height: 120,
                //     width: double.infinity,
                //   ),
                // ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                tabs[index][0],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      // color: Colors
                      //     .white
                    ), // style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   tabs[index],
          //   style: Theme.of(context).textTheme.bodyLarge,
          // ),
          // ]),
        ),
      ),
    ));
  }
}
